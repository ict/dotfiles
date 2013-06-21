#!/bin/sh
cd
rsync -av --delete --exclude-from scripts/rsync-exclude.txt lehre wemucs Bilder toybox i2s:backups &>>/tmp/rsyncbackup.log
