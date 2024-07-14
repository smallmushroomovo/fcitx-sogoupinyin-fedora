## fcitx-sogoupinyin on RHEL/Fedora
将搜狗输入法linux构建为rpm以在RHEL/Fedora中安装
## 安装(方法一)
 - 在[Release](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora/releases)中下载rpm包并：
```bash
sudo dnf install ./fcitx-sogoupinyin*.rpm --allowerasing
```
## 安装(方法二)
 - 准备构建环境
```bash
sudo dnf install rpmdevtools -y
rpmdev-setuptree
```
 - 克隆仓库
```bash
git clone https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-fedora.git
```
 - 开始构建
```bash
cd fcitx-sogoupinyin
rpmbuild -bb ./fcitx-sogoupinyin.spec
```
 - 如果出现“已写入”等字样，则表示构建成功
 - 安装已构建完成的包
```bash
cd ~/rpmbuild/RPMS/x86_64/
sudo dnf install ./fcitx-sogoupinyin*.rpm
```
## 卸载
```bash
sudo dnf remove fcitx-sogoupinyin    #此过程中可能会自动删除依赖(包括fcitx)
```
## 系统支持
 - Fedora 39:能正确地安装输入法与依赖
 - Fedora 40:能正确地安装输入法与依赖，但输入法图标可能会丢失
 - Red Hat Enterprise Linux 8/CentOS Linux 8/Rocky Linux 8/Alma Linux 8(在Alma Linux 8.9中测试):能正确地安装输入法，但需要引用来自于第三方源的依赖
 - Red Hat Enterprise Linux 7/CentOS Linux 7:理论上支持，未测试
 - Red Hat Enterprise Linux 9/Rocky Linux 9/Alma Linux 9:由于epel 9中没有fcitx及相关组件，无法正常安装
 - CentOS Stream:未知
 - Fedora Rawhide:未测试，但可能需要手动安装X11会话
## License
[MIT License](https://github.com/SmallMushroom-offical/fcitx-sogoupinyin-rhel/blob/main/LICENSE)
## 免责声明
本项目仅对搜狗输入法linux重新打包，对于搜狗输入法本身没有任何修改
## 注意事项
 - 请在构建时联网以下载构建需要的资源
 - 在GNOME环境下可能无法在gtk4/libadwaita程序中输入
 - 搜狗输入法不支持在Wayland下运行（这是搜狗输入法本身的问题！），如果安装成功后输入法面板闪烁，请将桌面会话更改为X11/XOrg
