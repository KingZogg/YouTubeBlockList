#!/bin/bash
# This should generate a list of domains 1-20 wrapped around a root "word"

## variables
DOCTOSPITOUT=/home/pi/anudeeptest/domainlist.txt
ROOTSUBSLIST=/home/pi/anudeeptest/rootsubs.txt

## whiptail required
WHATITIS=whiptail
WHATPACKAGE=whiptail
if
which $WHATITIS >/dev/null;
then
:
else
echo "Installing $WHATITIS"
apt-get install -y $WHATPACKAGE
fi

## Touch file
sudo touch $DOCTOSPITOUT

for source in `cat $ROOTSUBSLIST`;
do

for i in {1..20}
do
echo "r"$i"---sn-"$source".googlevideo.com" | tee --append $DOCTOSPITOUT &>/dev/null
echo "r"$i"---sn-"$source".googlevideo.com"

## Done with Loops
done
done
echo "Script complete"
