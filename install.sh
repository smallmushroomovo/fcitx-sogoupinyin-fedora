#!/bin/bash
pkgname=fcitx-sogoupinyin
pkgver=4.2.1.145
filename=${pkgname:6}_${pkgver}_amd64.deb
echo "1.Fedora"
echo "2.Red Hat Enterprise Linux 7/CentOS 7"
echo "3.Red Hat Enterprise Linux 8/CentOS 8/Rocky Linux 8/Alma Linux 8"
read -p "请选择您的系统：" redhatsys
echo "正在尝试安装依赖"
if [[ "$redhatsys" == "3" ]]; then
    sudo dnf -y install wget epel-release
    sudo dnf -y install fcitx fcitx-qt5
    wget https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/f/fcitx-configtool-0.4.10-1.el7.x86_64.rpm
    wget https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/u/unique-1.1.6-10.el7.x86_64.rpm
    sudo dnf -y install ./*.rpm
else
    sudo dnf -y install fcitx fcitx-qt5 fcitx-configtool
fi
sudo dnf -y install lsb-release libXScrnSaver gsettings-qt qt5-qtsvg qt5-qtdeclarative libidn bsdtar
echo "下载资源中..."
if [[ -f ./$filename ]]; then
    echo "$(gettext "找到 ")" "$filename"
else
    echo "$(gettext "正在下载 ")" "$filename ..."
    wget https://ime-sec.gtimg.com/202404252201/8d87995ad8846c2eadd4a9660151cecb/pc/dl/gzindex/1680521603/sogoupinyin_4.2.1.145_amd64.deb -O ./$filename
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
sudo echo 'export GTK_IM_MODULE=fcitx' >> ~/.bashrc
sudo echo 'export QT_IM_MODULE=fcitx' >> ~/.bashrc
sudo echo 'export XMODIFIERS=@im=fcitx' >> ~/.bashrc
echo "正在链接共享库..."
sudo cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
sudo ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
sudo ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
echo "安装完成"
echo "正在清除安装后无用的文件"
rm sogou*.deb
rm -rf $pkgdir
rm -rf src
if [[ "$redhatsys" == "3" ]]; then
   rm *.rpm
fi
echo "完成！，请重启以应用更改 "
