#!/bin/bash
read -p "确定要卸载吗？(y/N)" uninstall
if [[ "$uninstall" == "y" ]]; then
   echo "正在删除链接的共享库..."
   sudo rm /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so
   sudo rm /usr/lib64/fcitx/fcitx-sogoupinyin.so
   sudo rm /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogou*.so
   echo "正在删除fcitx-sogoupinyin..."
   sudo rm -rf /etc/X11/Xsession.d/72sogoupinyinsogouimebs
   sudo rm -rf /etc/xdg/autostart/*.desktop
   sudo rm -rf /opt/sogoupinyin/*
   sudo rm /usr/share/applications/sogoupinyin*.desktop
   sudo rm -rf /usr/share/doc/sogoupinyin/
   sudo rm /usr/share/fcitx/addon/fcitx-sogou*.conf
   sudo rm /usr/share/fcitx/imicon/sogou*
   sudo rm /usr/share/fcitx/inputmethod/sogou*
   echo "卸载完成，请重启以应用更改"
else
   exit
fi
