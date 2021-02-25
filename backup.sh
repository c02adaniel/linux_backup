#!/bin/bash
source /etc/backup/backup.conf
link=${location}/backup.ready
if [[ -f ${link} ]]; then
echo -e "\n"`date`"\n"
target=${location}/`date +%Y-%m-%d`/`date +%H-%M`
sudo mkdir -p ${target}
sudo echo `date` Biztonságimentés elkezdve... >>${target}/backup.log
sudo (dd bs=${bs_var} if=/dev/${source_dev} iflag=${iflag_var} ${other_var} | gzip > ${target}/backup.img.gz) 2&gt;&amp;1 | dialog --gauge "Running dd command (cloning), please wait..." 10 70 0 && sudo echo `date` Biztonságimentés sikeres! >>${target}/backup.log || sudo echo `date` Biztonságimentés sikertelen! >>${target}/backup.log
sudo ls -l -h ${target}/backup.img.gz
echo -e "\n"`date`"\n"
else
echo "Nem található a biztonsági mentés cél helye. Csatlakoztasd a meghajtót, vagy állíts be egy új célállomást az install.sh segítségével!"
fi
