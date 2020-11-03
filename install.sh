#!/bin/bash
config_hely="/etc/backup/backup.conf"
config_utvonal="utvonal="
config_mirol="mirol="
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
echo $config_utvonal$utvonal >> $config_hely
echo
echo -e "Kérlek add meg, hogy miről készül biztonsági másolat!\nCsak az eszköz nevét! Például: sda, sda0, sdb, sdb0, stb.\n Raspberry Pi-knél (Raspbian OS) a memóriakártya neve: mmcblk0"
read -p "Név: " mirol
echo $config_mirol$mirol >> $config_hely
echo
