#!/bin/bash
config_hely="/etc/backup/backup.conf"
config_tartalom="utvonal="
sudo mkdir /etc/backup
sudo cp backup.sh /etc/backup/
sudo ln -s /etc/backup/backup.sh /bin/backup
echo
echo -e "Kérlek add meg azt a helyet ahova a biztonsági másolatok készülni fognak!\nFONTOS: A végére nem kell perjel!\nPéldául: /media/data"
read -p "Elérésiút: " utvonal
echo $config_tartalom$utvonal >> $config_hely
echo
