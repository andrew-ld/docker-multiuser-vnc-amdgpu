#!/bin/bash

while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
    home="/home/$f1"

    if [[ $f6 == $home ]]; then
        if [ $(getent group $f1) ]; then
                if [ ! -d $home ]; then
                    mkdir $home
                fi
                
                chown -R "$f1:$f1" $home
                chmod -R 700 $home
        fi
    fi
done < /etc/passwd

X -configure
service dbus start
service lightdm start
