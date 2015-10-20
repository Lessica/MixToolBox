#!/bin/sh
mkdir Archives
cp -p MixToolBoxUI/Packages/*.deb Packages/
rm -rf MixToolBoxUI/Packages/*
rm -rf Packages/workspace
mkdir Packages/workspace
find Packages/ -name "*.deb" -exec dpkg -x {} Packages/workspace \;
find Packages/ -name "*MixToolBox_*.deb" -exec dpkg -e {} Packages/workspace/DEBIAN \;
find Packages/ -name ".DS_Store" -depth -exec rm {} \;
cd Packages/
find . -name "*MixToolBox_*.deb" -exec dpkg-deb -Z lzma -b workspace {} \;
find . -name "*MixToolBox_*.deb" -exec mv {} ../Archives/ \;
cd ..
rm -rf Packages/*
