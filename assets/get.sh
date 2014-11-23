#!/bin/bash

wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
mv vagrant.pub ../http/
wget http://download.virtualbox.org/virtualbox/4.3.20/VBoxGuestAdditions_4.3.20.iso
wget http://mirror.bytemark.co.uk/centos/5.11/isos/x86_64/CentOS-5.11-x86_64-netinstall.iso
wget http://mirror.bytemark.co.uk/centos/6.6/isos/x86_64/CentOS-6.6-x86_64-netinstall.iso
wget http://mirror.bytemark.co.uk/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-NetInstall.iso
