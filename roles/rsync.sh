#!/bin/bash
remotedata="/data/"
remoteserver="10.0.0.14"
localdata="/home/kpisoft/data"
remoteuser="prabhin"
rsync -avzh --delete -e ssh   $remoteuser@$remoteserver:$remotedata $localdata