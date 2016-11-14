# MIUI_patchrom_shamu
All the stuffs related to miui porting device Nexus 6

Based on the newset stock image:6.0.1(MOB31K)

# About:

1.Finished primary-patch and secondary-patch.

2.Fixed miui rejects and wrong patch.

3.Fixed TranslucentStatusBar darkmode not work and fixed color for navbar.

4.Fixed permissions for all.

5.Fixed fonts in miui.

6.Used connect.rom.miui.com as connectivity check server.

7.RemoteView: fix no such method error.

8.Added native root.

Caution:There is something wrong with smails, so it can not boot normally after building(make fullota).

# Instruction:

Get Android SDK

In order to build patchrom project, you must have android sdk installed.(http://developer.android.com/sdk/installing.html)

And add the sdk tools and platform-tools to PATH.

$ vim .bashrc

$ export PATH=$PATH:/home/xxx/android-sdk/tools:/home/xxx/anroid-sdk/platform-tools

Getting Started

To get started with MiCode/patchrom, you'll need to get familiar with Git and Repo.

To initialize your local repository using the patchrom trees, use a command like this:

$ mkdir patchrom

$ cd patchrom

$ repo init -u git://github.com/MiCode/patchrom.git -b marshmallow

Then to sync up:

$ repo sync

$ git clone https://github.com/sunnyfinder/MIUI_patchrom_shamu.git shamu

Build

$ . build/envsetup.sh && cd shamu

$ make fullota

And then look at out/fullota.zip,it is the MIUI ROM

Now you can get your own miui ROM!

# Thanks to:

Micode Miui Rom(https://github.com/MiCode)

Weibo:@木仁之(http://weibo.com/shumxin)

ddfzl(http://forum.xda-developers.com/member.php?u=5377263)

GitHub:Diorgenes

GitHub:wuxianlin
