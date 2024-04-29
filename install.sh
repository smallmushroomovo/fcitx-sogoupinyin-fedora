#!/bin/bash
pkgname=fcitx-sogoupinyin
pkgver=4.2.1.145
filename=${pkgname:6}_${pkgver}_amd64.deb
echo "1.Fedora"
echo "2.Red Hat Enterprise Linux 7/CentOS 7（未经测试）"
echo "3.Red Hat Enterprise Linux 8/CentOS 8(Stream)/Rocky Linux 8/Alma Linux 8"
read -p "请选择您的系统：" redhatsys
echo "正在尝试安装依赖"
if [[ "$redhatsys" == "3" ]]; then
    pacman=yum                              #将包管理器设置为pacman变量好让编写上更加统一(用pacman是因为用Arch用习惯了)
    sudo $pacman -y install wget epel-release
    sudo $pacman makecache
    sudo $pacman -y install fcitx fcitx-qt5 kcm-fcitx
    wget https://mirrors.ustc.edu.cn/opensuse/distribution/leap/15.5/repo/oss/x86_64/gsettings-qt-0.2-bp155.1.15.x86_64.rpm      #下载来自openSUSE的gsettings-qt
    wget https://mirrors.ustc.edu.cn/opensuse/distribution/leap/15.5/repo/oss/x86_64/libgsettings-qt1-0.2-bp155.1.15.x86_64.rpm
    wget https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/f/fcitx-configtool-0.4.10-1.el7.x86_64.rpm       #下载来自于RHEL 7的fcitx-configttol
    wget https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/u/unique-1.1.6-10.el7.x86_64.rpm                 #下载fcitx
    sudo $pacman -y install ./*.rpm                                                                         #安装不在源里的依赖包
    sudo $pacman -y install libXScrnSaver qt5-qtsvg qt5-qtdeclarative libidn bsdtar                         #安装其他在epel源里的依赖包(bsdtar用于解压deb包)
elif [[ "$redhatsys" == "2" ]]; then
    pacman=yum
    sudo $pacman -y install wget epel-release
    wget https://mirrors.ustc.edu.cn/opensuse/distribution/leap/15.5/repo/oss/x86_64/gsettings-qt-0.2-bp155.1.15.x86_64.rpm
    wget https://mirrors.ustc.edu.cn/opensuse/distribution/leap/15.5/repo/oss/x86_64/libgsettings-qt1-0.2-bp155.1.15.x86_64.rpm
    sudo $pacman -y install fcitx fcitx-qt5 fcitx-configtool
    sudo $pacman -y install libXScrnSaver qt5-qtsvg qt5-qtdeclarative libidn bsdtar
else
    pacman=dnf
    sudo $pacman -y install fcitx fcitx-qt5 fcitx-configtool
    sudo $pacman -y install lsb-release libXScrnSaver gsettings-qt qt5-qtsvg qt5-qtdeclarative libidn bsdtar
fi
echo "为防止冲突，现在卸载 ibus"
sudo $pacman -y remove ibus
echo "下载资源中..."
if [[ -f ./$filename ]]; then
    echo "$(gettext "找到 ")" "$filename"
else
    echo "$(gettext "正在下载 ")" "$filename ..."
    wget https://zunyun01.store.deepinos.org.cn/store/office/sogoupinyin/sogoupinyin_4.2.1.145.1_amd64.deb -O ./$filename        #这里在原PKGBUILD中使用了官网的下载链接，这里换了星火商店的源
fi
echo "解压资源中"
echo "使用 bsdtar 解压$filename"
bsdtar -xf $filename
mkdir pkg
pkgdir=pkg
tar -xJvf ./data.tar.xz -C "$pkgdir"
find $pkgdir/opt/sogoupinyin/files/{.license,share} -type d -exec chmod 755 {} \;
find $pkgdir/opt/sogoupinyin/files/{.license,share} -type f -exec chmod 644 {} \;
rm -rf $pkgdir/opt/sogoupinyin/files/lib/qt5
rm $pkgdir/opt/sogoupinyin/files/bin/qt.conf
echo "正在复制资源..."
sudo cp -r $pkgdir/usr/* /usr
sudo cp -r $pkgdir/etc/* /etc
sudo cp -r $pkgdir/opt/* /opt
echo "正在配置fcitx"
sudo chmod 777 /etc/profile
sudo cp /etc/profile ~/profile.bak         #将准备要修改的/etc/profile备份到home目录下的profile.bak
sudo echo 'export GTK_IM_MODULE=fcitx' >> /etc/profile
sudo echo 'export QT_IM_MODULE=fcitx' >> /etc/profile
sudo echo 'export XMODIFIERS=@im=fcitx' >> /etc/profile
echo "正在链接共享库..."
sudo cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
sudo ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
sudo ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
echo "安装完成"
echo "正在创建卸载命令..."
sudo cp ./uninstall.sh /bin/sogoupinyin-uninstall               #实质上是将卸载脚本复制到/bin目录下好让shell识别
sudo chmod 777 /bin/sogoupinyin-uninstall
echo "创建完成"
echo "您可以使用sudo sogoupinyin-uninstall命令进行卸载"
echo "正在清除安装后无用的文件"
rm sogou*.deb
rm -rf pkg
rm ./*.tar.xz
if [[ "$redhatsys" == "3" ]]; then
   rm *.rpm                                       #删除手动下载的包(不是卸载)
fi
sudo $pacman -y remove bsdtar
echo "完成！，请重启以应用更改 "
