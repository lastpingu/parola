#!/bin/bash

#₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺₺#
# a script by lazy-pwny #
#$$$$$$$$$$$$$$$$$$$$$$$#

#default encrypter is md5
#you'r default password is "parola"
#for change this password you can write this:
#./parola.bash --password

kirmizi="\e[91m"
tp="\e[0m"

trap '' SIGTSTP
trap '' 2
 
#ponysay "Enter The Magic Word!"
echo -n "trying to access @ " ; date | awk '{print $1, $2, $3, $4, $6}'

echo -n "parola:" ; read -st 5 a
x=$( cat parola )
h=$( echo $a | md5sum )
if [[ $x == $h ]] ; then
	echo ""
    echo "access successed!"
    exit 0
else
	echo ""
    while :
	do
	 echo -e "passed: '$SECONDS' seconds; ${kirmizi}[ you didn't say the magic word!! ]${tp}" ; sleep 1.5
    done
fi
if [[ "$1" =~ ^(--password|-pw|passwword)$ ]] ; then
	echo -n "enter the new password: "; read parola
echo $parola | md5sum > parola
fi
trap SIGTSTP
trap 2
#echo -e $x ; echo -e $h
