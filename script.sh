#!/bin/bash
# This should generate a list of domains 1-20 wrapped around a root "word"

## variables
REPONAME=youtubeadsblacklist
REPODIR=/etc/"$REPONAME"/
REPOOWNER=anudeepND
GITREPOSITORYURL="github.com/"$REPOOWNER"/"$REPONAME".git"
DOCTOSPITOUT="$REPODIR"domainlist.txt
ROOTSUBSLIST="$REPODIR"rootsubs.txt
TEMPFILE="$REPODIR"tempfile.temp

## whiptail required
WHATITIS=whiptail
WHATPACKAGE=whiptail
if
which $WHATITIS >/dev/null;
then
echo "$WHATITIS Already Installed"
else
echo "Installing $WHATITIS"
apt-get install -y $WHATPACKAGE
fi

## gawk required
WHATITIS=gawk
WHATPACKAGE=gawk
if
which $WHATITIS >/dev/null;
then
echo "$WHATITIS Already Installed"
else
echo "Installing $WHATITIS"
apt-get install -y $WHATPACKAGE
fi

## Did you pull from online?
if
(whiptail --title "$REPONAME" --yesno "Did you git pull from github?" 10 80) 
then
echo "GREAT!!!!"
else
DIDWEPULL=true
fi

if
[[ -n $DIDWEPULL ]]
then
if
(whiptail --title "$REPONAME" --yesno "Would you like to attempt git pull now?" 10 80) 
then
git -C $REPODIR pull
else
exit
fi
fi

## Remove old list
CHECKME=$DOCTOSPITOUT
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
else
:
fi

## Sort and dedupe rootsubs list
cat -s $ROOTSUBSLIST | sort -u | gawk '{if (++dup[$0] == 1) print $0;}' > $TEMPFILE
mv $TEMPFILE $ROOTSUBSLIST

for source in `cat $ROOTSUBSLIST`;
do

echo "Processing $source"
echo ""

for i in {1..20}
do
echo "r"$i"---sn-"$source".googlevideo.com" | tee --append $DOCTOSPITOUT
echo "r"$i".sn-"$source".googlevideo.com" | tee --append $DOCTOSPITOUT

#echo "r"$i"---sn-"$source".googlevideo.com" | tee --append $DOCTOSPITOUT &>/dev/null
#echo "r"$i"---sn-"$source".googlevideo.com"
#echo "r"$i".sn-"$source".googlevideo.com" | tee --append $DOCTOSPITOUT &>/dev/null
#echo "r"$i".sn-"$source".googlevideo.com"

## Done with Loops
done
echo ""
echo ""
done

HOWMANYLINES=$(echo -e "`wc -l $DOCTOSPITOUT | cut -d " " -f 1`")
echo "New List Contains $HOWMANYLINES Domains."

## Pushlists?
if
(whiptail --title "anudeeptest" --yesno "Do you want to push list to github" 10 80) 
then
timestamp=$(echo `date`)
GITHUBUSERNAME=$(whiptail --inputbox "Github Username?" 10 80 "" 3>&1 1>&2 2>&3)
GITHUBPASSWORD=$(whiptail --inputbox "Github Password?" 10 80 "" 3>&1 1>&2 2>&3)
GITWHERETOPUSH=https://"$GITHUBUSERNAME":"$GITHUBPASSWORD"@"$GITREPOSITORYURL"
git -C $REPODIR remote set-url origin $GITWHERETOPUSH
git -C $REPODIR add .
git -C $REPODIR commit -m "Update lists $timestamp"
git -C $REPODIR push -u origin master
else
:
fi
