#!/bin/bash
# This should generate a list of domains 1-20 wrapped around a root "word"

## variables
DOCTOSPITOUT=/home/pi/domainlist.txt

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

DOMAINTOGENERATE=$(whiptail --inputbox "What root subdomain are you generating?" 10 80 "" 3>&1 1>&2 2>&3)

sudo touch $DOCTOSPITOUT

for i in {1..20}
do
echo "r"$i"---sn-"$DOMAINTOGENERATE".googlevideo.com" | tee --append $DOCTOSPITOUT &>/dev/null
echo "r"$i"---sn-"$DOMAINTOGENERATE".googlevideo.com"
done

echo "Script complete"
