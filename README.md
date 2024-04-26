## fcitx-sogoupinyin on RHEL/Fedora
## 这是什么？
一个在Fedora上安装搜狗输入法的sh脚本(基于[fcitx-sogoupinyin AUR包](https://aur.archlinux.org/packages/fcitx-sogoupinyin)的PKGBUILD修改)
## 如何使用？
 - 首先尝试更新系统
```bash
sudo yum -y upgrade --nobest   #这里使用nobest参数是防止依赖问题导致更新失败
```
 - 然后安装git，并克隆仓库
```bash
sudo yum -y install git
git clone https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora.git
git clone https://mirror.ghproxy.com/https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora.git   ##镜像
```
 - 运行脚本
```bash
cd fcitx-sogoupinyin-fedora
chmod a+w ./install.sh
bash ./install.sh
```
## 能在RHEL9上使用吗？
RHEL 9因epel源中没有fcitx，故暂无法支持
## License
[MIT License](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora?tab=MIT-1-ov-file)
## 声明
本程序仅删除了少数配置文件，对于搜狗输入法本身没有任何修改
## 注意事项
 - 安装时必须联网（这是当然）
 - 如果无法下载搜狗输入法deb包，请前往[官网](https://shurufa.sogou.com/linux)下载并复制到脚本目录 
