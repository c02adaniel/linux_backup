#!/bin/bash
config_hely="/etc/backup/backup.conf"
config_tartalom="utvonal="
install_loc=`dirname "$BASH_SOURCE"`
sudo mkdir -p /etc/backup
sudo cp $install_loc/backup.sh /etc/backup/
link=/bin/backup
if [ ! -f $link ]; then
  #echo "=> File doesn't exist"
  sudo ln -s /etc/backup/backup.sh /bin/backup
fi
sudo chmod +x /etc/backup/backup.sh
sudo chmod +x /bin/backup
echo
echo -e "Kérlek add meg azt a helyet ahova a biztonsági másolatok készülni fognak!\nFONTOS: A végére nem kell perjel!\nPéldául: /media/data"
read -p "Elérésiút: " utvonal
echo $config_tartalom$utvonal >> $config_hely
echo
