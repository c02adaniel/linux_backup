#!/bin/bash
config_location="/etc/backup/backup.conf"
config_text1="location="
config_text2="source_dev="
config_text3="bs_var="
config_text4="status_var="
config_text5="iflag_var="
config_text6="other_var="
install_loc=`dirname "$BASH_SOURCE"`
sudo apt update
sudo apt install pv gzip -y
#wget https://raw.githubusercontent.com/c02adaniel/linux_backup/main/backup.sh
sudo mkdir -p /etc/backup
sudo rm -f /etc/backup/backup.sh
sudo rm -f /etc/backup/backup.conf
sudo cp ${install_loc}/backup.sh /etc/backup/
link=/bin/backup
if [[ ! -f ${link} ]]; then
  #echo "=> File doesn't exist"
  sudo ln -s /etc/backup/backup.sh /bin/backup
fi
sudo chmod +x /etc/backup/backup.sh
sudo chmod +x /bin/backup
echo
echo -e "Kérlek add meg azt a helyet ahova a biztonsági másolatok készülni fognak!\nFONTOS: A végére nem kell perjel!\nPéldául: /media/data"
read -p "Elérésiút: " location
echo ${config_text1}"${location}" >> ${config_location}
sudo touch ${location}/backup.ready
echo
echo -e "Kérlek add meg, hogy miről készül biztonsági másolat!\nCsak az eszköz nevét! Például: sda, sda0, sdb, sdb0, stb.\n Raspberry Pi-knél (Raspbian OS) a memóriakártya neve: mmcblk0"
read -p "Név: " source_dev
echo ${config_text2}"${source_dev}" >> ${config_location}
echo '# dd parameters - start' >> ${config_location}
echo ${config_text3}$"16M" >> ${config_location}
echo ${config_text4}$"progress" >> ${config_location}
echo ${config_text5}$"nofollow,noatime" >> ${config_location}
echo ${config_text6}$"" >> ${config_location}
echo '# dd parameters - end' >> ${config_location}
echo
