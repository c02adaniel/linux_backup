#!/bin/bash
config_location="/etc/backup/backup.conf"
config_text1="utvonal="
config_text2="mirol="
install_loc=`dirname "$BASH_SOURCE"`
sudo mkdir -p /etc/backup
sudo cp ${install_loc}/backup.sh /etc/backup/
link=/bin/backup
if [ ! -f ${link} ]; then
  #echo "=> File doesn't exist"
  sudo ln -s /etc/backup/backup.sh /bin/backup
fi
sudo chmod +x /etc/backup/backup.sh
sudo chmod +x /bin/backup
echo
echo -e "Kérlek add meg azt a helyet ahova a biztonsági másolatok készülni fognak!\nFONTOS: A végére nem kell perjel!\nPéldául: /media/data"
read -p "Elérésiút: " location
echo ${config_text1}${location} >> ${config_location}
sudo touch ${location}/backup.ready
echo
echo -e "Kérlek add meg, hogy miről készül biztonsági másolat!\nCsak az eszköz nevét! Például: sda, sda0, sdb, sdb0, stb.\n Raspberry Pi-knél (Raspbian OS) a memóriakártya neve: mmcblk0"
read -p "Név: " source_dev
echo ${config_text2}${source_dev} >> ${config_location}
echo
