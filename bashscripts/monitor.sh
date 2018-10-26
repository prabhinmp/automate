#!/bin/bash
master=10.0.0.244
user=kpisoft
port=22
rsyncloc="/home/kpisoft/"
count=0
/bin/nc -z $master $port 
function takebackup {
    pgrep rsync.sh
    ssh $user@$master /home/kpisoft/rsyncfromslave.sh
}
if [ "$?" = 0 ]; then
    ##
else 
    exit 
fi

    