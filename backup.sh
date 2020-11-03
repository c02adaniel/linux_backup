#!/bin/bash
source /etc/backup/backup.conf
link=$utvonal/backup.ready
if [ ! -f $link ]; then
hely=$utvonal/`date +%Y-%m-%d`/`date +%H-%M`
sudo mkdir -p $hely
sudo echo `date` Biztonságimentés elkezdve... >>$hely/backup.log
sudo dd bs=16M if=/dev/$mirol status=progress iflag=nofollow,noatime | gzip > $hely/backup.img.gz && sudo echo `date` Biztonságimentés sikeres! >>$hely/backup.log || sudo echo `date` Biztonságimentés sikertelen! >>$hely/backup.log
sudo ls -l -h $hely/backup.img.gz
else
echo "Nem található a biztonsági mentés cél helye. Csatlakoztasd a meghajtót, vagy állíts be egy új célállomást az install.sh segítségével!"
fi
