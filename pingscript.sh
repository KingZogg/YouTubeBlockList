#!/bin/bash
## This should ping the listed domains to see if they are valid

## variables
REPONAME=youtubeadsblacklist
REPODIR=/etc/"$REPONAME"/
REPOOWNER=anudeepND
GITREPOSITORYURL="github.com/"$REPOOWNER"/"$REPONAME".git"
DOCTOSPITOUT="$REPODIR"domainlist.txt
ROOTSUBSLIST="$REPODIR"rootsubs.txt
TEMPFILE="$REPODIR"tempfile.temp

DOCTOSPITOUTB="$REPODIR"domainlistpinged.txt

## Remove old list
CHECKME=$DOCTOSPITOUTB
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
else
:
fi

for source in `cat $DOCTOSPITOUT`;
do

echo "Processing $source"
echo ""

SOURCEIPFETCH=`ping -c 1 $source`
SOURCEIP=`echo $SOURCEIPFETCH`

if
[[ -n $SOURCEIP ]]
then
echo "$source is located at $SOURCEIP"
echo "Ping Test Was A Success!"
echo "$source" | tee --append $DOCTOSPITOUTB
else
:
fi

done
