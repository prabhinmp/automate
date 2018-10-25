#!/bin/bash
datafolder="/data"
remoteserver="10.0.0.14"
backupdirecory=/data
remoteuser="prabhin"
rsync -azh $datafolder $remoteuser@$remoteserver:$backupdirecory