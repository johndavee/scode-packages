#!/bin/bash
#
#
# SCode IDE Compiler
# Script created by SCode Bot & Other contributors.
# 
#
clear
figlet SCode 
figlet Compiler 
echo "Docs: https://jaseunda.gitbook.io/scode-studio/"
echo " "
echo "-Jaseunda"
echo " "
echo " "
echo " "
apt-get update && apt-get upgrade -y
pkg update
pkg install git -y
apt update && apt upgrade -y && pkg update -y && pkg install git ruby curl clang proot make -y && git clone https://github.com/Linuxbrew/brew.git ~/prefix/brew && cd ~/prefix/brew && alias brew="termux-chroot $PWD/bin/brew"
brew install bundletool

#Installing Java

#Java Libraries compiled by Hax4us, scripts written by Hax4us, MasterDevX and Guzio, with some very, very tiny help from Harshiv-Patel.
#Setup Java
set -e
shopt -s expand_aliases
alias ee='echo -e'

#Greetings
echo
ee "\e[93mJava Libraries compiled by \e[32mHax4us\e[93m, script written by \e[32mHax4us \e[93mand \e[32mMasterDevX\e[93m."
echo

#Checking for existing Java installation
if [ -e $PREFIX/bin/java ]
then
	ee "\e[32mJava is already installed!"
	echo
	exit
else
	#Checking, whether is someone trying to cheat and simplyfy their installation it on Linux (i.e. x86 (not listad, as you can see) machine) using this script, which have no reason to work.
	case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64"; tag="v8" ;;
	arm64)
		archname="aarch64"; tag="v8" ;;
	armhf)
		archname="arm"; tag="v8-151" ;;
	armv7l)
		archname="arm"; tag="v8-151" ;;
	arm)
		archname="arm"; tag="v8-151" ;;
	*)
		ee "\e[91mERROR: Unknown architecture."; echo; exit ;;
	esac

	#Actual installation
	ee "\e[32m[*] \e[34mDownloading JDK-8 (~70Mb) for ${archname}...  🕛This will take some time, so better make a coffee.🕛"
	wget https://github.com/Hax4us/java/releases/download/${tag}/jdk8_${archname}.tar.gz -q

	ee "\e[32m[*] \e[34mMoving JDK to system..."
	mv jdk8_${archname}.tar.gz $PREFIX/share

	ee "\e[32m[*] \e[34mExtracting JDK..."
	cd $PREFIX/share
	tar -xhf jdk8_${archname}.tar.gz

	ee "\e[32m[*] \e[34mSeting-up %JAVA_HOME%..."
	export JAVA_HOME=$PREFIX/share/jdk8
	echo "export JAVA_HOME=$PREFIX/share/jdk8" >> $HOME/.profile

	ee "\e[32m[*] \e[34mCoping Java wrapper scripts to bin..."
	#I'm not 100% sure, but getting rid of bin contnent MAY cause some issues with %JAVA_HOME%, thus it's no longer moved - copied instead. Sorry to everyone short on storage.
	cp bin/* $PREFIX/bin

	ee "\e[32m[*] \e[34mCleaning up temporary files..."
	rm -rf $HOME/installjava
	rm -rf $PREFIX/share/jdk8_${archname}.tar.gz
	rm -rf $PREFIX/share/bin

	echo
	ee "\e[32mSCode Compiler was successfully installed!\e[39m"
	echo "Enjoy :D"
	echo "For more information goto: https://jaseunda.gitbook.io/scode-ide/"
fi
