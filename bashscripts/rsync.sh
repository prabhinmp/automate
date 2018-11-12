#!/bin/bash
remotedata="/data/"
remoteserver="10.0.0.14"
localdata="/home/username/data"
remoteuser="prabhin"
rsync -avzh --delete -e ssh   $remoteuser@$remoteserver:$remotedata $localdata