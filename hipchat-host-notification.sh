#!/bin/bash

while getopts t:r: option
do
        case "${option}"
        in
                t) TOKEN=${OPTARG};;
                r) ROOMID=${OPTARG};;
        esac
done

/usr/local/bin/hipsaint -V 2 --token="$TOKEN" --room="$ROOMID" --type=host --inputs="$HOSTNAME|$LONGDATETIME|$NOTIFICATIONTYPE|$HOSTADDRESS|$HOSTSTATE|$HOSTOUTPUT" -n
