#!/bin/bash

CHKSCRIPTURL="https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/froxlor_version"
CHKSCRIPT="froxlor_version"

INSTPATH="/usr/lib/check_mk_agent/local"

# Alte Installationen aus verschachtelten Intervall-Ordnern (z. B. /10800/) löschen
rm -f $INSTPATH/*/$CHKSCRIPT

# Verzeichnis anlegen (falls nicht existent) und Skript im Hauptordner platzieren
mkdir -p $INSTPATH
wget -O $INSTPATH/$CHKSCRIPT $CHKSCRIPTURL
chmod +x $INSTPATH/$CHKSCRIPT

echo "Installation abgeschlossen!"
echo "Bitte nutze Setup -> Service Discovery in Checkmk für diesen Host, um die Änderungen zu übernehmen."

