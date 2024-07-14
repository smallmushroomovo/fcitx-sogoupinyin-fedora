%define name fcitx-sogoupinyin
%define version 4.2.1.145
%define release 1
%define sourcename %{name}-%{version}-%{release}-x86_64.deb
%define buildroot %{_tmppath}/%{name}-%{version}-root
%define _builddir %{_topdir}/BUILD
%define __arch_install_post %{nil}
%define __os_install_post %{nil}

Summary: Sogou Pinyin for Linux
Name: %{name}
Version: %{version}
Release: %{release}
License: custom
URL: https://shurufa.sogou.com/linux
Requires: fcitx, fcitx-qt5, fcitx-configtool, lsb-release, libXScrnSaver, gsettings-qt, qt5-qtsvg, qt5-qtdeclarative, libidn
BuildRequires: bsdtar, tar, wget
BuildRoot: %{buildroot}
AutoReqProv: no

%description
Detailed description of the package and its functionality.

%prep
wget https://zunyun01.store.deepinos.org.cn/store/office/sogoupinyin/sogoupinyin_%{version}.%{release}_amd64.deb -O %{sourcename}
mkdir -p %{_builddir}/source
bsdtar -xf %{sourcename} -C %{_builddir}/source

%install
cd %{_builddir}/source
tar -xJvf data.tar.xz -C %{buildroot}
mv %{buildroot}/usr/lib/*-linux-gnu/fcitx %{buildroot}/usr/lib/
rmdir %{buildroot}/usr/lib/*-linux-gnu
find %{buildroot}/opt/sogoupinyin/files/{.license,share} -type d -exec chmod 755 {} \;
find %{buildroot}/opt/sogoupinyin/files/{.license,share} -type f -exec chmod 644 {} \;
rm -rf %{buildroot}/opt/sogoupinyin/files/lib/qt5

%clean
rm -rf %{_builddir}/source

%postun
fcitx restart

%files
/opt/sogoupinyin/
/etc/xdg/autostart/sogoupinyin*.desktop
/etc/X11/Xsession.d/72sogoupinyinsogouimebs
/usr/lib/fcitx/fcitx-sogoupinyin*.so
/usr/share/fcitx/addon/fcitx-sogoupinyin*.conf
/usr/share/fcitx/imicon/sogoupinyin.png
/usr/share/fcitx/inputmethod/sogoupinyin.conf
/usr/share/applications/sogoupinyin*.desktop
/usr/share/doc/sogoupinyin/
/usr/share/icons/hicolor/
/usr/share/icons/bloom/

%changelog
* Sun Jul 14 2024 Small Mushroom <jxk370@126.com> 0.1-1
- rpm package
