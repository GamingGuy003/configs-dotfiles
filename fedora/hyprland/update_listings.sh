#!/bin/bash
flatpak list > flatpaks
dnf list > packages_list
rm -rfv yum.repos.d || yes
cp -r /etc/yum.repos.d .
