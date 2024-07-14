## 在RHEL 8中安装fcitx-sogoupinyin-fedora
虽然本项目是为fedora打造的，但考虑到可能有极小部分需求，因此编写了此文档以说明RHEL兼容性
## 系统支持(RHEL and based on RHEL)
 - Red Hat Enterprise Linux 7/CentOS Linux 7/Oracle Linux 7:理论上支持，未测试
- Red Hat Enterprise Linux 8/CentOS (Stream) Linux 8/Oracle Linux 8/Rocky Linux 8/Alma Linux 8(在Alma Linux 8.9中测试):能正确地安装输入法，但需要引用来自于第三方源的依赖
 - Red Hat Enterprise Linux 9/Rocky Linux 9/Alma Linux 9:由于epel 9中没有fcitx及相关组件，无法正常安装
 - CentOS Stream 9:未知
 ## 关于依赖
 fcitx-sogoupinyin所需要的依赖可能无法在源里找到，因此我们需要来自第三方源的依赖包
  - 以下是缺失的依赖包的安装方式
 ```bash
 sudo yum install -y https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/f/fcitx-configtool-0.4.10-1.el7.x86_64.rpm
 sudo yum install -y https://mirrors.nju.edu.cn/epel/7/x86_64/Packages/u/unique-1.1.6-10.el7.x86_64.rpm
sudo yum install -y https://pkgs.sysadmins.ws/el8/base/x86_64/gsettings-qt-0-0.25.20180723bzr85.el8.x86_64.rpm
```
 - 除此之外，如果您没有安装epel源，请安装
```bash
sudo yum install -y epel-release
```
