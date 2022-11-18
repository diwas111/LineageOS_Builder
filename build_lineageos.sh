#!/usr/bin/env bash

# Install the platform-tools
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~

# add Android SDK platform tools to path
echo "if [ -d "$HOME/platform-tools" ] ; then
          PATH="$HOME/platform-tools:$PATH"
      fi" >> ~/.profile

# Create the directories
mkdir -p ~/bin
mkdir -p ~/android/lineage

# Install the repo command
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

# Put the ~/bin directory in your path of execution
echo "# set PATH so it includes user's private bin if it exists
      if [ -d "$HOME/bin" ] ; then
          PATH="$HOME/bin:$PATH"
      fi" >> ~/.profile

echo "export USE_CCACHE=1
      export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc

ccache -M 50G

cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

repo sync

cd ~/android/lineage

source build/envsetup.sh
breakfast a3xelte

cd ~/android/lineage/device/samsung/a3xelte

./extract-files.sh

croot
brunch a3xelte

cd $OUT
