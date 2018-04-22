#!/bin/bash

typeset -A config # init array
#set configuration parameters for Ikea tradfri hub.
config=( # set default values in config array
    [psk]="iDevE8ZluPgGcpL1"
    [ip_hub]="192.168.2.178"
    [hostname]="localhost"
)

if [ "$1" = "switch" ]
then
	if [ "$3" = "on" ]
	then
	coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5850": 1 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
	fi

	if [ "$3" = "off" ]
	then
	coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5850": 0 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
	fi
fi

if  [ "$1" = "mood" ]
then
	if [ "$3" = "warm" ]
	then
	coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5709": 33135, "5710": 27211 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
	fi

        if [ "$3" = "cold" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5709": 24930, "5710": 24684 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi

        if [ "$3" = "normal" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5709": 30140, "5710": 26909 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi
fi

if  [ "$4" != "" ]
then
        if [ "$4" = "1" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5851": 64 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi
        if [ "$4" = "2" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5851": 128 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi
        if [ "$4" = "3" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5851": 172 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi
        if [ "$4" = "4" ]
        then
        coap-client -m put -u "IDENTITY" -k "${config[psk]}" -e '{ "3311": [{ "5851": 254 }] }' "coaps://${config[ip_hub]}:5684/15001/$2"
        fi

fi

