#!/bin/bash
date +'%d/%m/%Y %H:%M:%S' > /Applications/System_Enhancements/macports_updater/macports.out.log
echo ' ' >> /Applications/System_Enhancements/macports_updater/macports.out.log
date +'%d/%m/%Y %H:%M:%S' > /Applications/System_Enhancements/macports_updater/macports.err.log
echo ' ' >> /Applications/System_Enhancements/macports_updater/macports.err.log
bash -c '/opt/local/bin/port selfupdate ; echo " " ; /opt/local/bin/port -puN upgrade outdated ; echo " " ; /opt/local/bin/port uninstall inactive ; /opt/local/bin/port uninstall leaves'
