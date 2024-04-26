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
chmod a+w ./uninstall.sh
bash ./uninstall.sh    #卸载时不会自动卸载依赖！
```
## 能在RHEL9上使用吗？
RHEL 9因epel源中没有fcitx，故暂无法支持
## License
[MIT License](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel/blob/main/LICENSE)
## 声明
本程序仅删除了少数配置文件，对于搜狗输入法本身没有任何修改
## 注意事项
 - 该方法无法使用包管理器进行管理！因此您只能使用sogoupinyin-uninstall命令进行卸载
 - 安装时必须联网（这是当然）
 - 如果无法下载搜狗输入法deb包，请前往[官网](https://shurufa.sogou.com/linux)下载并复制到脚本目录
 - 搜狗输入法不支持在Wayland下运行（这是搜狗输入法本身的问题！），如果安装成功后输入法面板闪烁，请将桌面会话更改为X11 
