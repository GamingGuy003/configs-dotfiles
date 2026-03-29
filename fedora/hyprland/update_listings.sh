#!/bin/bash
flatpak list >flatpaks
dnf list >packages_list
rm -rf yum.repos.d || yes
cp -rv /etc/yum.repos.d .
