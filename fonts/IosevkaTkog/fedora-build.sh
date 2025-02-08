#!/bin/bash

sudo dnf install ttfautohint
sudo dnf install fontforge

git clone ~/source/repos/https://github.com/be5invis/Iosevka.git

cp private-build-plans.toml ~/source/repos/Iosevka

cd ~/source/repos/Iosevka
npm install
npm run build -- ttf::IosevkaTkog --jCmd=8

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
unzip FontPatcher.zip -d font-patcher

for x in ls dist/IosevkaTkog/TTF/IosevkaTkog-*; do
    fontforge -script font-patcher/font-patcher -c $x --out dist/IosevkaTkog/TTF/NerdFonts;
done
