# linux_backup
### Telepítés:
1. Csatlakoztatni kell egy külső meghajtót, usb-t vagy hálózatit
2. Meg kell nyitni egy terminál ablakot, vagy ssh-t és a következő parancsokat kell lefuttatni
 ```
 $ sudo apt update
 $ sudo apt install git -y
 $ git clone https://github.com/c02adaniel/linux_backup.git
 $ chmod +x linux_backup/*.sh
 $ sudo linux_backup/install.sh
 ```
3. A telepítőben meg kell adni
* annak a külső meghajtón lévő könyvtárnak az elérési útját, ahova a biztonsági mentés kerül.
__Az elérési útvonal végére nem kell perjel!__ Például: _/media/usbshare01/backup_
* annak az eszköznek a nevét, amiről készül a biztonsági mentés. Például: *sda*, *sda0*, *sdb*, stb. **Raspberry Pi-knél (Raspbian OS) a memóriakártya neve:** *mmcblk0*

 ### Biztonsági mentés
A biztonsági mentéshez meg kell nyitni egy terminál ablakot, vagy ssh-t és a következő parancsot kell lefuttatni:
```
$ backup
```
### Leírás
A biztonsági mentéskor létrejön egy könyvtár az aktuális dátummal és azon belül egy alkönyvtár a mentés időpontjával, ahova kerül a tömörített képfájl.
*$backupdir/[YYYY-MM-DD]/[HH-MM]/backup.img.gz*

### Megjegyzés
* Ez csak Debian alapú *Raspbian*-on, jelenlegi nevén *Raspberry Pi OS*-en lett kipróbálva.
* A telepítő még nem ellenőrzi, hogy 
  * létezik-e a külső meghajtó és a könyvtár
  * helyes-e az eszköz neve
* A biztonsági mentést végző script még nem ellenőrzi, hogy
  * van-e elegendő szabad hely
* Log-olás fejlesztés alatt
