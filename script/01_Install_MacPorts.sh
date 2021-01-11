#!/bin/sh

#   Install_MacPorts.sh
#
#   term7 / 02.12.2020

#   This installation script is meant to be educational and a resource for learning for unexperienced users. It has a lot of functionality that may be considered unnecessary from an advanced user's perspective. I.e. it pauses at certain times during the installation and displays a countdown. It echoes all commands to the terminal window and at certain times during the installation it displays informative texts and asks for user input. From a coders perspective who knows exactly what he/she wants, this may be a waste of time - yet we have written this script with users in mind that are not used to the command line. We hope that by running this script, users will take the time to go through the installation process, in order to understand the mechanics behind this script.

#   MIT License
#   Copyright (c) 2020

#   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function countdown
{
local OLD_IFS="${IFS}"
IFS=":"
local ARR=( $1 )
local SECONDS=$((  (ARR[0] * 60 * 60) + (ARR[1] * 60) + ARR[2]  ))
local START=$(date +%s)
local END=$((START + SECONDS))
local CUR=$START

while [[ $CUR -lt $END ]]
do
CUR=$(date +%s)
LEFT=$((END-CUR))

printf "\r%02d:%02d:%02d" \
$((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

sleep 1
done
IFS="${OLD_IFS}"
echo "        "
}

bold=$(tput bold)
normal=$(tput sgr0)

sudo echo '\n'
echo '\n'
echo "                                            / MACPORTS / WHAT THIS SCRIPT DOES /"
echo "--------------------------------------------------------------------------------"
echo '\n'
echo "This script is designed to install MacPorts on your Computer."
echo " "
echo "The MacPorts Project is an open-source community initiative that enables you to"
echo "install and compile software, that otherwise runs natively on Linux."
echo "Another popular packet manager is Homebrew - however we prefer MacPorts."
echo " "
echo "We use MacPorts to install command line tools that are otherwise not available"
echo "on MacOS, but necessary to install and configure sevaral tools we use to enhance"
echo "our DIGITAL SECURITY and our ONLINE PRIVACY."
echo '\n'
echo "MacPorts requires Xcode and Xcode Command Line Tools to be installed on your"
echo "System. Please install Xcode from the Apple AppStore before you press [ENTER]."
echo " "
echo "Afterwards this script will first help you to install Xcode Command Line Tools,"
echo "before it proceeds to compile MacPorts."
echo '\n'
echo "--------------------------------------------------------------------------------"
read -s -p "After you installed Xcode, press [ENTER] to install Xcode Command Line Tools: "

echo '\n'

sudo xcode-select --install
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

echo '\n'
echo "--------------------------------------------------------------------------------"
echo "Now, please agree to the Xcode License."
echo '\n'
read -s -p "Press [ENTER] to continue: "

sudo xcodebuild -license
sudo xcodebuild -runFirstLaunch

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                   ------------------------------------------";
echo "                   ARE YOU SURE YOU WANT TO INSTALL MACPORTS?";
echo "                   ------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'

while true
do
read -p "Type [install] to install MACPORTS, or [exit] to abort & press [ENTER]: " CONT
case $CONT in
[i][n][s][t][a][l][l])


echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.6.4.tar.bz2
tar xf MacPorts-2.6.4.tar.bz2
echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'

cd MacPorts-2.6.4/
./configure

echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
make

echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
sudo make install

sudo rm -r ~/MacPorts*

ZSHRC=~/.zshrc
[ -e "$ZSHRC" ] || touch "$ZSHRC"

tee -a "$ZSHRC" << EOF > /dev/null
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
EOF

break;;
[e][x][i][t])

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                A B O R T I N G";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"
exit;;
*)

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                        --------------------------------";
echo "                        INVALID INPUT - PLEASE TRY AGAIN";
echo "                        --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
;;
esac
done

echo '\n'
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to continue: "

echo '\n'
echo '\n'
echo "                                                / MACPORTS / AUTOMATIC UPDATES /"
echo "--------------------------------------------------------------------------------"
echo '\n'
echo "This script can configure AUTOMATIC UPDATES for you."
echo '\n'
echo "If you choose to install MACPORTS AUTOMATIC UPDATES, this script will configure"
echo "a Launch Daemon that runs the required commands once everytime you start your"
echo "computer."
echo '\n'
echo '\n'
echo '\n'
echo "You can find the UPDATE SCRIPT and all log files in this location:"
echo "/Application/System_Enhancements/macports_updater"
echo '\n'
echo '\n'
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to continue: "

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                 -------------------------------------------";
echo "                 DO YOU WANT TO CONFIGURE AUTOMATIC UPDATES?";
echo "                 -------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
while true
do
read -r -p "Type [configure] to set up, or [skip] to skip and press [ENTER]: " CONT2
case $CONT2 in
[c][o][n][f][i][g][u][r][e])

echo '\n'
echo '\n'

echo "Installation Path: /Library/LaunchDaemons/macports.updater.plist"

ENHANCEMENT_FOLDER=/Applications/System_Enhancements
UPDATE_FOLDER=$ENHANCEMENT_FOLDER/macports_updater
LOG_OUT=$UPDATE_FOLDER/macports.out.log
LOG_ERR=$UPDATE_FOLDER/macports.err.log

UPDATER=$UPDATE_FOLDER/macports_updater.sh

DAEMON_FOLDER=/Library/LaunchDaemons
UPDATER_NAME=macports.updater
UPDATER_DAEMON=$DAEMON_FOLDER/$UPDATER_NAME.plist

if [ ! -d "$ENHANCEMENT_FOLDER" ]; then
  sudo mkdir $ENHANCEMENT_FOLDER
fi

sudo mkdir $UPDATE_FOLDER

sudo touch "$LOG_OUT"
sudo touch "$LOG_ERR"

sudo tee "$UPDATER" << EOF > /dev/null
#!/bin/bash
date +'%d/%m/%Y %H:%M:%S' > $LOG_OUT
echo ' ' >> $LOG_OUT
date +'%d/%m/%Y %H:%M:%S' > $LOG_ERR
echo ' ' >> $LOG_ERR
bash -c '/opt/local/bin/port selfupdate ; /opt/local/bin/port -puN upgrade outdated ; /opt/local/bin/port uninstall inactive ; /opt/local/bin/port uninstall leaves'
EOF


sudo chown root:wheel "$UPDATER"
sudo chown $(whoami):admin "$LOG_OUT" "$LOG_ERR"
sudo chmod 744 "$UPDATER"
sudo chmod 644 "$LOG_OUT" "$LOG_ERR"


[ -e "$UPDATER_DAEMON" ] || sudo touch "$UPDATER_DAEMON"

#  The MacPorts Updater LaunchDaemon runs at boot time as root.

sudo tee "$UPDATER_DAEMON" << EOF > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>${UPDATER_NAME}</string>
<key>LaunchOnlyOnce</key>
<true/>
<key>ProgramArguments</key>
<array>
    <string>${UPDATER}</string>
</array>
<key>StandardOutPath</key>
<string>${LOG_OUT}</string>
<key>StandardErrorPath</key>
<string>${LOG_ERR}</string>
<key>StartInterval</key>
<integer>300</integer>
</dict>
</plist>
EOF

echo '\n'

#  At last we set file ownership and permissions and load the Updater.

echo "sudo chown root:wheel /Library/LaunchDaemons/macports.updater.plist"
sudo chown root:wheel "$UPDATER_DAEMON"

echo "sudo chmod 644 /Library/LaunchDaemons/macports.updater.plist"
sudo chmod 644 "$UPDATER_DAEMON"

echo "sudo launchctl load /Library/LaunchDaemons/macports.updater.plist"
sudo launchctl load "$UPDATER_DAEMON"

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                F I N I S H E D";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"

break;;
[s][k][i][p])

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                F I N I S H E D";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"
exit;;
*)

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                        --------------------------------";
echo "                        INVALID INPUT - PLEASE TRY AGAIN";
echo "                        --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
;;
esac
done

exit
