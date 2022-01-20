#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

source /etc/backup/backup.conf
link=${location}/backup.ready
if [[ -f ${link} ]]; then
echo -e "\n"`date`"\n"
target=${location}/`date +%Y-%m-%d`/`date +%H-%M`
${SUDO} mkdir -p ${target}
${SUDO} echo `date` Biztonságimentés elkezdve... >>${target}/backup.log
${SUDO} dd bs=${bs_var} if=/dev/${source_dev} status=${status_var} iflag=${iflag_var} ${other_var} | gzip > ${target}/backup.img.gz && ${SUDO} echo `date` Biztonságimentés sikeres! >>${target}/backup.log || ${SUDO} echo `date` Biztonságimentés sikertelen! >>${target}/backup.log
${SUDO} ls -l -h ${target}/backup.img.gz
echo -e "\n"`date`"\n"
else
echo "Nem található a biztonsági mentés cél helye. Csatlakoztasd a meghajtót, vagy állíts be egy új célállomást az install.sh segítségével!"
fi
