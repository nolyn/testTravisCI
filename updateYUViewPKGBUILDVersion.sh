#!/bin/bash
echo "Cd to tmp"
cd /tmp
echo "Cloning aur pkg"
git clone git+ssh://aur.archlinux.org/yuview-git.git
cd yuview-git

# get the new version:
echo "Cloning YUView"
git clone https://github.com/IENT/YUView
cd YUView
new_version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
echo ${new_version}
cd ..

# echo "Updated version in files"
# sed -i "s/pkgver=.*$/pkgver=${new_version}/" PKGBUILD
# sed -i "s/pkgver = .*$/pkgver = ${new_version}/" .SRCINFO

# echo "commiting and pushing new version"
# git add -u
# git commit -m "updated package version"
# git push

