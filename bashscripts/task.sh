#!/usr/bin/bash
#make sure that you have shared a folder in windows  to linux with username and password.
#mount the windows share to /share folder in windows folder.
# mount –t smbfs //ipadd/sharename /mountpoint –o username=userid,workgroup=workgroupname

backupfolder="/data"
nowdate=$(date +"%Y-%m-%d")
sfusername=root
sfhost=10.0.0.x
executefolder=/deploy/
cd $executefolder
mkdir proces-$nowdate
scp $sfusername@$sfhost:$backupfolder/* process-$nowdate
cd proces-$nowdate
ls -l > output.$nowdate.txt
cp out.$nowdate.txt /share


