#!/usr/bin/env bash
## COPY MAIN CONFIG FILES!!

#VARS
CONFIG4TB=/home/martin/4TB/Backups/Config_Backup
ISCSI=/run/media/martin/084838c0-5823-4c7f-8faf-0f447e4f3285
F4TB=/home/martin/4TB
PUBENCRYPTKEY=/public_driveEncryptKey.pem
NEXTCLOUD=/home/martin/Nextcloud
CONFIGTMP=/tmp/copy_config_tmp

#COPIES

cp $HOME/.config/starship.toml $CONFIG4TB/Starship

# Fish
cp -r $HOME/.config/fish $CONFIG4TB/fish

# Scripts
cp -r $HOME/Scripts/* $CONFIG4TB/Scripts/

# Doom
cp $HOME/.doom.d/* $CONFIG4TB/doom

# Aegis
cp $NEXTCLOUD/AegisBackup/* $CONFIG4TB/Aegis

# Bashrc
cp $HOME/.bashrc $CONFIG4TB/Bash

#Emacs
cp -r $HOME/Emacs/* $F4TB/Backups/Emacs

# Tmux 
cp  $HOME/.tmux.conf  $CONFIG4TB/Tmux

# Alacritty 
cp $HOME/.config/alacritty/* $CONFIG4TB/Alacritty

#Crontab
sudo crontab -l >> $CONFIG4TB/Cron/cron_jobs.txt

##############################################################################################################################
######################################################        FILES      #####################################################
############################################   !!!!   REQUIRES ENCRYPTION   !!!!   ###########################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################

## FILES ##
# SSH
zip -r -Z bzip2 $HOME/.ssh/ssh.zip $HOME/.ssh
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in $HOME/.ssh/ssh.zip -out $CONFIG4TB/SSH/SSH.zip.enc -pass file:$PUBENCRYPTKEY
rm $HOME/.ssh/ssh.zip

#FSTAB
cat /etc/fstab >> $HOME/.fstab.bak
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in $HOME/.fstab.bak -out $CONFIG4TB/fstab/fstab.bak.enc -pass file:$PUBENCRYPTKEY
rm $HOME/.fstab.bak

#CRYPTAB
cat /etc/crypttab >> $HOME/.crypttab.bak
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in $HOME/.crypttab.bak -out $CONFIG4TB/crypt/crypttab.bak.enc -pass file:$PUBENCRYPTKEY
rm $HOME/.crypttab.bak

# Scripts
zip -r -Z bzip2 $HOME/Scripts/Scripts.zip $HOME/Scripts
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in $HOME/Scripts/Scripts.zip -out $CONFIG4TB/Scripts/Scripts.zip.enc -pass file:$PUBENCRYPTKEY
rm $HOME/Scripts/Scripts.zip

#Windows RDP Secret Key
cat $HOME/.secrets/windows_rdp.txt >> $HOME/windows_rdp.bak
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in $HOME/windows_rdp.bak -out $CONFIG4TB/Secrets/windows_rdp.bak.enc -pass file:$PUBENCRYPTKEY
rm $HOME/windows_rdp.bak

##############################################################################################################################
######################################################       Keys        #####################################################
############################################   !!!!   REQUIRES ENCRYPTION   !!!!   ###########################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
# KEYS ##
#2TB NVME Drive
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in /.2tbkey -out $CONFIG4TB/keys/.2tbkey.bak.enc -pass file:$PUBENCRYPTKEY

#crypto_keyfile.bin
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in /crypto_keyfile.bin -out $CONFIG4TB/keys/crypto_keyfile.bin.bak.enc -pass file:$PUBENCRYPTKEY

#Public Drive Key used for these encryptions
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -salt -in /public_driveEncryptKey.pem -out $CONFIG4TB/keys/public_driveEncryptionKey.pem.bak.enc -pass file:$PUBENCRYPTKEY

##############################################################################################################################
##############################################################################################################################
############################################   !!!!   BACKUPS FOR BACKUPS!   !!!!   ##########################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################

# Copy Config Backup Folder from 4tb to iscsi
cp -r $F4TB/Backups/* $ISCSI/Backups


mkdir $CONFIGTMP

cp -r $F4TB/Backups $CONFIGTMP

zip -r -Z bzip2 $NEXTCLOUD/backups.zip $CONFIGTMP

## cp $CONFIGTMP/backups.zip $NEXTCLOUD

rm -r $CONFIGTMP
