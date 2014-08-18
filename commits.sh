#!/bin/bash

#put this in Root of your PAC Folder and run chmod +x commits.sh
#Folder 11 must in the root of your PAC Folder too

SOURCE=~/pac # Edit to your PAC Folder

cd $SOURCE && cd frameworks/base
patch -p1 < $SOURCE/11/0001-Base-1-2-Implement-App-circle-sidebar.patch
git add -A && git commit -m "Base: 1/2 Implement App circle sidebar" --author "Yanuar Harry <ai.the.smarties.physics@gmail.com>"
patch -p1 < $SOURCE/11/0001-Base-2-2-App-circle-sidebar-add-support-floating-win.patch
git add -A && git commit -m "Base: 2/2 App circle sidebar (add support floating window)" --author "Yanuar Harry <ai.the.smarties.physics@gmail.com>"
patch -p1 < $SOURCE/11/0001-Base-App-Circle-sidebar-add-support-Samsung-multiwin.patch
git add -A && git commit -m "Base: App Circle sidebar (add support Samsung multiwindow)" --author "Yanuar Harry <ai.the.smarties.physics@gmail.com>"
git apply < $SOURCE/11/0001-Base-App-Circle-Bar-Toggle-1-2.patch
git add -A && git commit -m "Base: App Circle Bar Toggle [1/2]" --author "Alex-Cruz <mazdarider23@gmail.com>"
git apply < $SOURCE/11/0001-Base-Omni-Floating-window-with-multitasking.patch
git add -A && git commit -m "Omni: Floating window with multitasking" --author "D4rKn3sSyS <jesdga95@gmail.com>"
patch -p1 < $SOURCE/11/0001-Base-App-Circle-Sidebar-Support-for-Configurable-Tri.patch
git add -A && git commit -m "Base: App Circle Sidebar: Support for Configurable Trigger" --author "0xD34D <clakdawg@gmail.com>"

cd $SOURCE && cd packages/apps/Settings
git apply < $SOURCE/11/0001-Settings-Implement-App-circle-sidebar.patch
git add -A && git commit -m "Settings: Implement App circle sidebar" --author "Yanuar Harry <ai.the.smarties.physics@gmail.com>"
patch -p1 < $SOURCE/11/0001-Settings-App-Circle-Bar-Toggle-2-2.patch
git add -A && git commit -m "Settings: App Circle Bar Toggle [2/2]" --author "Alex-Cruz <mazdarider23@gmail.com>"
patch -p1 < $SOURCE/11/0001-Settings-App-Circle-Sidebar-Support-for-Configurable.patch
git add -A && git commit -m "Settings: App Circle Sidebar: Support for Configurable Trigger" --author "0xD34D <clakdawg@gmail.com>"
git apply < $SOURCE/11/0001-Settings-Driving-Mode.patch
git add -A && git commit -m "Driving Mode " --author "Yanuar Harry <ai.the.smarties.physics@gmail.com>"
cd $SOURCE