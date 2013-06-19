#!/bin/sh
cd
rsync -av --exclude-from scripts/rsync-exclude.txt lehre wemucs Bilder toybox i2s:backups
