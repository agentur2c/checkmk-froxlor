#!/bin/bash

CHKSCRIPTURL="https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/froxlor_version"
CHKSCRIPT="froxlor_version"

INSTPATH="/usr/lib/check_mk_agent/local"
CACHESEC="10800"

mkdir -p $INSTPATH/$CACHESEC
wget -O $INSTPATH/$CACHESEC/$CHKSCRIPT $CHKSCRIPTURL
chmod +x $INSTPATH/$CACHESEC/$CHKSCRIPT

echo "Please use Setup -> Service Discovery on your Checkmk for this host"
