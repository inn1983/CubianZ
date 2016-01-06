#!/bin/bash -x

#PWD="`pwd`"
#CWD=$(cd "$(dirname "$0")"; pwd)
CWD="/home/wkdir"
cd $CWD

apt-get update 
apt-get install -y build-essential
apt-get install -y git

git clone http://scmadmin@cubieboard.info:8080/scm/git/zuikicam

#
apt-get install -y libcommoncpp2-dev

#install sendemail
apt-get install -y sendemail
apt-get install -y libnet-ssleay-perl libio-socket-ssl-perl
cd /usr/share/perl5/IO/Socket
mv SSL.pm SSL.pm.orig
cp $CWD/zuikicam/sendemail/SSL.pm .

#glib install
aptitude install -y libglib2.0-dev

#libjpeg
ln -s $CWD/zuikicam/src/libjpeg/lib/libjpeg.so /usr/lib/arm-linux-gnueabihf/libjpeg.so.9

#rtmp server install
cd $CWD
mkdir -p rtmptest/crtmp
cd rtmptest/crtmp
wget http://cubieboard.jp/downloadfiles/crtmp_build.tar.gz
tar zxvf crtmp_build.tar.gz

#web server install
apt-get install -y apache2

#lte install
apt-get install -y eject
apt-get install -y pppconfig
cd $CWD
git clone http://scmadmin@cubieboard.info:8080/scm/git/lte_config
cd lte_config
cp 99-l-03f.rules /etc/udev/rules.d/98-l-03f.rules
cd /etc
mv ppp ppp.orig
mv chatscripts chatscripts.orig
cp -r $CWD/lte_config/ppp .
cp -r $CWD/lte_config/chatscripts .
