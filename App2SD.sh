#!/bin/bash

#put this in Root of your PAC Folder and run chmod +x App2SD.sh
#Folder App2SD must in the root of your PAC Folder too

SOURCE=~/pac # Edit to your PAC Folder

#######################################################
#    App2SD Support                                   #
# Credits to Xiao-Long Chen                           #
#######################################################

###################################################
#If you use JFLTE DEVICE, USE THIS AND COMMENT OUT#
###################################################
#cd $SOURCE && cd device/samsung/jflte
#patch -p1 < $SOURCE/App2SD/0001-jflte.patch && git add -A && git commit -m "jflte: App 2SD Enable app moving support" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"

###################################################
#If you use D2LTE DEVICE, USE THIS AND COMMENT OUT#
#Change if needed and made a patch                #
###################################################
#cd $SOURCE && cd device/samsung/d2lte
#git fetch https://gerrit.slimroms.net/SlimRoms/device_samsung_d2lte refs/changes/13/8513/4 && git cherry-pick FETCH_HEAD

###################################################
#If you use P51XX DEVICE, USE THIS AND COMMENT OUT#
#Change if needed and made a patch                #
###################################################
#cd $SOURCE && cd device/samsung/p5100
#git fetch https://gerrit.slimroms.net/SlimRoms/device_samsung_p5100 refs/changes/21/8521/1 && git cherry-pick FETCH_HEAD

###################################################
#If you use P31XX DEVICE, USE THIS AND COMMENT OUT#
#Change if needed and made a patch                #
###################################################
#cd $SOURCE && cd device/samsung/p3100
#git fetch https://gerrit.slimroms.net/SlimRoms/device_samsung_p3100 refs/changes/20/8520/1 && git cherry-pick FETCH_HEAD

#######################################################
#If you use Galaxy S2 DEVICE, USE THIS AND COMMENT OUT#
#Change if needed and made a patch                    #
#######################################################
#cd $SOURCE && cd device/samsung/galaxys2-common
#git fetch https://gerrit.slimroms.net/SlimRoms/device_samsung_galaxys2-common refs/changes/66/9166/1 && git cherry-pick FETCH_HEAD

###################################################
#If you use I9500 DEVICE, USE THIS AND COMMENT OUT#
#Change if needed and made a patch                #
###################################################
#cd $SOURCE && cd device/samsung/i9500
#git fetch https://gerrit.slimroms.net/SlimRoms/device_samsung_i9500 refs/changes/26/9526/1 && git cherry-pick FETCH_HEAD

#######################################################
#If you use a other Device, you must write self and   #
#See other Patches by Gerrit from SlimRom             #
#######################################################

##########
###MAIN###
##########

cd $SOURCE && cd frameworks/native
patch -p1 < $SOURCE/App2SD/0001-native-App2SD-Calculate-application-sizes-correctly.patch && git add -A && git commit -m "Native:  App 2SD Calculate application sizes correctly" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"

cd $SOURCE && cd system/vold
patch -p1 < $SOURCE/App2SD/0001-Vold-App2SD.patch && git add -A && git commit -m "Vold: App 2SD Allow ASEC containers on an external volume when internal is emulated" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"

cd $SOURCE && cd frameworks/base
patch -p1 < $SOURCE/App2SD/0001-Framework-App2SD-changes-for-moving-applications-to-externa.patch && git add -A && git commit -m "Framework: App 2SD Changes for moving applications to external volume" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"
patch -p1 < $SOURCE/App2SD/0001-frameworks-App2SD-Add-class-for-changing-app-moving-setting.patch && git add -A && git commit -m "Frameworks: App 2SD Add class for changing app moving setting" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"

cd $SOURCE && cd packages/apps/Settings
patch -p1 < $SOURCE/App2SD/0001-Settings-App2SD1-Add-app-moving-setting.patch && git add -A && git commit -m "Settings: App 2SD Add app moving setting to the menu in Settings -> Apps" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"
patch -p1 < $SOURCE/App2SD/0001-Settings-App2SD-Enable-moving-applications-to-an-external-volume.patch && git add -A && git commit -m "Settings: App 2SD Enable moving applications to an external volume" --author "Xiao-Long Chen <chenxiaolong@cxl.epac.to>"
cd $SOURCE