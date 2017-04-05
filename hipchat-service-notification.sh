#!/bin/bash

while getopts t:r: option
do
        case "${option}"
        in
                t) TOKEN=${OPTARG};;
                r) ROOMID=${OPTARG};;
        esac
done

/usr/local/bin/hipsaint -V 2 --token="$TOKEN" --room="$ROOMID" --type=service --inputs="$SERVICEDESC|$HOSTALIAS|$LONGDATETIME|$NOTIFICATIONTYPE|$HOSTADDRESS|$SERVICESTATE|$SERVICEOUTPUT" -n
