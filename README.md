## fcitx-sogoupinyin on RHEL/Fedora
## 这是什么？
一个在RHEL/Fedora上安装搜狗输入法的sh脚本(基于[fcitx-sogoupinyin AUR包](https://aur.archlinux.org/packages/fcitx-sogoupinyin)的PKGBUILD修改)
## 如何安装？
 - 首先尝试更新系统
```bash
sudo yum -y upgrade --nobest   #这里使用nobest参数是防止依赖问题导致更新失败
```
 - 然后安装git，并克隆仓库
```bash
sudo yum -y install git
git clone https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel.git
git clone https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel.git   ##镜像
```
 - 运行脚本
```bash
cd fcitx-sogoupinyin-rhel
chmod a+w ./install.sh
bash ./install.sh
```
## 如何卸载？
```bash
sudo sogoupinyin-uninstall    #卸载时不会自动卸载依赖！
```
## 具体支持什么系统？
 - Fedora 39:能正确地安装输入法与依赖
 - Fedora 40:未测试，理论上能够正常工作
 - Red Hat Enterprise Linux 8/CentOS Linux 8/Rocky Linux 8/Alma Linux 8:能正确地安装输入法与依赖(部分依赖来自于其它操作系统的源，但能正常工作)
 - Red Hat Enterprise Linux 7/CentOS Linux 7:理论上支持，未测试
 - Red Hat Enterprise Linux 9/Rocky Linux 9/Alma Linux 9:由于epel 9中没有fcitx及相关组件，无法正常安装
 - CentOS Stream:未知
## License
[MIT License](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel/blob/main/LICENSE)
## 声明
本程序仅对于搜狗输入法的deb包做了相关处理以在RedHat/Fedora上安装，对于搜狗输入法本身没有任何修改
## 注意事项
 - 该方法无法使用包管理器进行管理！因此您只能使用sogoupinyin-uninstall命令进行卸载
 - 安装时必须联网（这是当然）
 - 如果无法下载搜狗输入法deb包，请前往[官网](https://shurufa.sogou.com/linux)下载并复制到脚本目录
 - 搜狗输入法不支持在Wayland下运行（这是搜狗输入法与fcitx本身的问题！），如果安装成功后输入法面板闪烁，请将桌面会话更改为X11 
