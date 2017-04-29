#!/usr/bin/env sh
cd /tmp
git clone git+ssh://aur.archlinux.org/yuview-git.git
cd yuview-git

# get the new version:
git clone https://github.com/IENT/YUView
cd YUView
new_version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
echo ${new_version}
cd ..

sed -i "s/pkgver=.*$/pkgver=${new_version}/" PKGBUILD
sed -i "s/pkgver = .*$/pkgver = ${new_version}/" .SRCINFO

git add -u
git commit -m "updated package version"
git push

