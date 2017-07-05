#!/bin/bash
## Pushlists

## variables
source /etc/youtubeadsblacklist/script/vars/scriptvars.var

if
(whiptail --title "anudeeptest" --yesno "Do you want to push list to github" 10 80) 
then
timestamp=$(echo `date`)
GITHUBUSERNAME=$(whiptail --inputbox "Github Username?" 10 80 "" 3>&1 1>&2 2>&3)
GITHUBPASSWORD=$(whiptail --inputbox "Github Password?" 10 80 "" 3>&1 1>&2 2>&3)
WHYYOUDODIS=$(whiptail --inputbox "Why are you doing a manual push?" 10 80 "Update lists $timestamp" 3>&1 1>&2 2>&3)
GITWHERETOPUSH=https://"$GITHUBUSERNAME":"$GITHUBPASSWORD"@"$GITREPOSITORYURL"
sed "s/LASTRUNTIMEGOESHERE/$timestamp/" $MAINREADMEDEFAULT > $MAINREADME
git -C $REPODIR remote set-url origin $GITWHERETOPUSH
git -C $REPODIR add .
git -C $REPODIR commit -m "$WHYYOUDODIS"
git -C $REPODIR push -u origin master
else
:
fi
