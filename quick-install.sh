#!/bin/bash

CHKSCRIPTURL="https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/froxlor_version"
CHKSCRIPT="froxlor_version"

INSTPATH="/usr/lib/check_mk_agent/local"

rm $INSTPATH/*/$CHKSCRIPT

mkdir -p $INSTPATH
wget -O $INSTPATH/$CHKSCRIPT $CHKSCRIPTURL
chmod +x $INSTPATH/$CHKSCRIPT

echo "Please use Setup -> Service Discovery on your Checkmk for this host"
