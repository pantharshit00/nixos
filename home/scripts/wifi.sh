#!/usr/bin/env bash

SSID=`nmcli -f SSID,RATE,SIGNAL -t d wifi list ifname wlan0|sed -n '1p'|cut -d':' -f1`
RATE=`nmcli -f SSID,RATE,SIGNAL -t d wifi list ifname wlan0|sed -n '1p'|cut -d':' -f2`
SIGNAL=`nmcli -f SSID,RATE,SIGNAL -t d wifi list ifname wlan0|sed -n '1p'|cut -d':' -f3`

echo "$SSID ($RATE $SIGNAL%)"
