#!/usr/bin/env bash

CONFIG4TB=/home/martin/4TB/Backups/Config_Backup
ISCSI=/run/media/martin/084838c0-5823-4c7f-8faf-0f447e4f3285
F4TB=/home/martin/4TB
PUBENCRYPTKEY=/public_driveEncryptKey.pem
NEXTCLOUD=/home/martin/Nextcloud
CONFIGTMP=/tmp/copy_config_tmp
FILEN=/home/martin/Filen

##SCRIPT RUNS ONCE A WEEK TO COPY IMPORTANT DOCS OFFSITE##

mkdir $CONFIGTMP

cp -r $F4TB/Backups $CONFIGTMP

zip -r -Z bzip2 $CONFIGTMP/backups.zip $CONFIGTMP

cp $CONFIGTMP/backups.zip $FILEN

rm -r $CONFIGTMP
