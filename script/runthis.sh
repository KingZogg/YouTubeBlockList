#!/bin/bash
## This will make it so that future runs go even smoother

echo ""
echo "____________________________________________________________________________"
echo ""

## variables
source /etc/youtubeadsblacklist/script/vars/scriptvars.var

## Pull down
git -C $REPODIR pull

echo "____________________________________________________________________________"
echo ""

bash $MAINSCRIPT
