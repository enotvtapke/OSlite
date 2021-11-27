#!/bin/bash

prevBackupName=`ls ~ | grep -e 'Backup-' | sort | tail -n 1`
prevBackup=~/$prevBackupName
mkdir -p ~/restore
rm ~/restore/*
cp $prevBackup/* ~/restore
for file in `ls ~/restore`; do
  if [ `echo $file | grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}$"` ]; then
    rm ~/restore/$file
  fi
done
#ls ~/restore | grep -e "[0-9]{4}-[0-9]{2}-[0-9]{2}" | rm
