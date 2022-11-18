#!/usr/bin/env bash

#Install the platform-tools
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~

# add Android SDK platform tools to path
echo "if [ -d "$HOME/platform-tools" ] ; then
         PATH="$HOME/platform-tools:$PATH"
      fi" >> .profile
source ~/.profile




#
