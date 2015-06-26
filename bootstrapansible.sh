#!/bin/sh
sudo apt-get update
sudo apt-get install -y python python-pip
dpkg -s python>/root/booststrapAnsible.txt
