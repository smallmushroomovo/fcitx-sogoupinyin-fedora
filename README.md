## fcitx-sogoupinyin on RHEL/Fedora
---

>该项目已支持rpm打包，此分支不再维护。
>仅作留档作用

---
在RHEL/Fedora上安装搜狗输入法的脚本程序
## 如何安装？
 - 检查系统是否为最新
 - RHEL
```bash
sudo yum -y upgrade --nobest
```
 - Fedora
```bash
sudo dnf -y upgrade --nobest
```
 - 然后安装git，并克隆仓库
```bash
sudo yum -y install git
git clone https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora.git
```
 - 在中国，你有时可能无法使用以上链接，请使用镜像
```bash
git clone https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora.git
```
 - 运行脚本
```bash
cd fcitx-sogoupinyin-rhel
chmod a+w ./install.sh
bash ./install.sh
```
## 如何卸载？
```bash
sogoupinyin-uninstall    #请不要以root身份(即使用sudo运行)！这可能会导致系统灾难性的损坏！
```
## 这个脚本有什么缺点
 - ~~该脚本用了一个*十分取巧*的方法进行安装，因此无法使用包管理器进行操作~~已支持[rpm打包](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora/blob/rpmbuild-sogoupinyin/fcitx-sogoupinyin.spec)
 - 该脚本没有像[fcitx-sogoupinyin](https://aur.archlinux.org/packages/fcitx-sogoupinyin)那样检查文件完整性，如有需要请自行检查
## 具体支持什么系统？
 - Fedora 39:能正确地安装输入法与依赖
 - Fedora 40:能正确地安装输入法与依赖~~，但输入法图标可能会丢失~~
 - Red Hat Enterprise Linux 8/CentOS Linux 8/Rocky Linux 8/Alma Linux 8(在Alma Linux 8.9中测试):能正确地安装输入法与依赖(部分依赖来自于其它操作系统的源，但能正常工作)
 - Red Hat Enterprise Linux 7/CentOS Linux 7:理论上支持，未测试
 - Red Hat Enterprise Linux 9/Rocky Linux 9/Alma Linux 9:由于epel 9中没有fcitx及相关组件，无法正常安装
 - CentOS Stream:未知
 - Fedora Rawhide:未测试，但可能需要手动安装X11会话
## License
[MIT License](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel/blob/main/LICENSE)
## 声明
本程序仅对搜狗输入法linux解包安装，对于搜狗输入法本身没有任何修改
## 注意事项
 - 安装时必须联网（这是当然）
 - 如果无法下载搜狗输入法deb包，请前往[官网](https://shurufa.sogou.com/linux)下载并复制到脚本目录
 - 无法在gtk4/libadwaita程序中输入
 - 搜狗输入法不支持在Wayland下运行（这是搜狗输入法本身的问题！），如果安装成功后输入法面板闪烁，请将桌面会话更改为X11/Xorg
