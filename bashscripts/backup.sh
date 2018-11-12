#!/bin/bash
set -e
nowdate=$(date +"%Y-%m-%d")
dayago=`(date --date='03 days ago' '+%Y-%m-%d')`
mondate=$(date +"%Y-%m")
backup=/backup/data
if [ -d "$backup/$mondate" ]; then
    echo "found month folder"
    mv /var/log/apache2/access-1.log $backup/$mondate/access-1.$nowdate.log
    mv /var/log/apache2/access-2.log $backup/$mondate/access-2.$nowdate.log
    gzip  $backup/$mondate/access-1.$nowdate.log
    gzip  $backup/$mondate/access-2.$nowdate.log
    rm $backup/$mondate/access-1.$dayago.log
    rm $backup/$mondate/access-2.$dayago.log
else
    echo "no month folder found creating $mondate"
    mkdir $backup/$mondate/
    mv /var/log/apache2/access-1.log $backup/$mondate/access-1.$nowdate.log
    mv /var/log/apache2/access-2.log $backup/$mondate/access-2.$nowdate.log
    gzip  $backup/$mondate/access-1.$nowdate.log
    rm $backup/$mondate/access-1.$dayago.log
    rm $backup/$mondate/access-2.$dayago.log
fi