#!/bin/bash
source /etc/backup/backup.conf
link=${location}/backup.ready
if [[ -f ${link} ]]; then
target=${location}/`date +%Y-%m-%d`/`date +%H-%M`
sudo mkdir -p ${target}
sudo echo `date` Biztonságimentés elkezdve... >>${target}/backup.log
sudo dd bs=${bs_var} if=/dev/${source_dev} status=${status_var} iflag=${iflag_var} ${other_var} | gzip > ${target}/backup.img.gz && sudo echo `date` Biztonságimentés sikeres! >>${target}/backup.log || sudo echo `date` Biztonságimentés sikertelen! >>${target}/backup.log
sudo ls -l -h ${target}/backup.img.gz
else
echo "Nem található a biztonsági mentés cél helye. Csatlakoztasd a meghajtót, vagy állíts be egy új célállomást az install.sh segítségével!"
fi
