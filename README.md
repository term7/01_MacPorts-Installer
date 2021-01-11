# 01 - Install MacPorts


This installation script is targeted to users who wish to make informed decisions and who want to improve their privacy and security on a Mac. We want everybody to be able to able to do this installation, which is why this script is meant to be educative and a source of learning - even for users who have never used the command line (Terminal.app) before.

This script has been tested on MacOS Big Sur.
The installation is running stable on our own Macs.

However, we will not provide warranties of any kind. Only you are resposible if you break something during this installation.
To suggest improvements, please report an issue or send a pull request.


## Why install MacPorts?

The MacPorts Project is an open-source community initiative that enables you to install and compile software on your Mac, that otherwise runs natively on Linux. Another popular packet manager is Homebrew. However we prefer MacPorts. If you want to use other install scripts we wrote, you need to install MacPorts as well.

<p align="center">
  <img src="/png/Macports_Installer.png" title="MacPorts Installer">
</p>

## PREREQUISITES

MacPorts requires Xcode to be installed on your Mac. Please download Xcode from the Apple Appstore.

## INSTALLATION

01_Install_MacPorts.sh is a script that will download and compile MacPorts for you. It also will check if you have already set up and installed all required prerequisites. If you don't, the script will point you into the right direction. Simply execute the installation script in a terminal window, when prompted type your admin password and press ENTER. Then follow the installation instructions.
If you are an advanced user, you probably already have MacPorts or Homebrew installed on your system. If you want to speed up the installation, please select the non-interactive script 01_Speedy_Install_MacPorts.sh instead.

Both Scripts will setup a daemon that will check for updates whenever you restart for your computer. It will also unclutter your MacPorts installation if necessary.

If you don't want to use MacPorts anymore, simply run 01_Uninstall_MacPorts.sh to purge MacPorts, the MacPorts updater daemon, and all other MacPorts installations from your system.

If you want to go through the installation process on your own, please follow the original instructions by the MacPorts project:

* [https://www.macports.org/install.php](https://www.macports.org/install.php)


## Usage

You can also update and clean MacPorts manually. To do so, open a Terminal Window to type commands. You can also search for specific packages, look up additional info, select variants, etc. We list here only a few commands as examples. Please refer to the MacPorts documentation for a full manual: 

* [https://guide.macports.org/](https://guide.macports.org/)


Update MacPorts:

    sudo port -v selfupdate


Upgrade your MacPorts Installations:

    sudo port -v upgrade outdated


Unclutter your MacPorts Installation:

    sudo port uninstall inactive
    sudo port uninstall leaves

    

## MIT License

Copyright (c) 2021 term7

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
