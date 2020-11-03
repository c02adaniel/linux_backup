# linux_backup
### Telepítés:
1. csatlakoztatni kell egy külső meghajtót, usb-t vagy hálózatit
2. Meg kell nyitni egy terminál ablakot, vagy ssh-t és a következő parancsokat kell lefuttatni
 ```
 $ sudo apt update
 $ sudo apt full-upgrade -y
 $ sudo apt install git -y
 $ git clone https://github.com/c02adaniel/linux_backup.git
 $ sudo linux_backup/install.sh
 ```
3. A telepítőben meg kell adni annak a külső meghajtón lévő könyvtárnak az elérési útját ahova a biztonsági mentés kerül.
__Az elérési útvonal végére nem kell perjel!__

 ### Biztonsági mentés
A biztonsági mentéshez meg kell nyitni egy terminál ablakot, vagy ssh-t és a következő parancsot kell lefuttatni:<br>
```
$ backup
```
### Leírás
A biztonsági mentéskor létrejön egy könyvtár az aktuális dátummal és azon belül egy alkönyvtár a mentés időpontjával, ahova kerül a tömörített képfájl.
*$backupdir/[YYYY-MM-DD]/[HH-MM]/backup.img.gz*
