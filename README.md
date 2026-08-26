# Checkmk Local Check für Froxlor Update-Status

Dieses Bash-Skript integriert eine automatische Prüfung auf verfügbare Froxlor-Updates in **Checkmk**. Es nutzt das offizielle Froxlor-CLI, fängt die Ausgabe ab und bereitet sie im passenden Format für einen Checkmk **Local Check** auf.

## Getestet mit folgenden Versionen
* Checkmk Community (formerly Raw) 2.5.0p12
* Froxlor > 2.3.9

## Features
* **Automatische Erkennung:** Prüft, ob ein neues Froxlor-Update bereitsteht.
* **Sicherheits-Fallbacks:** Meldet `CRITICAL`, wenn der CLI-Befehl fehlschlägt (z. B. bei PHP- oder Datenbankproblemen) oder `UNKNOWN`, falls das Verzeichnis fehlt.
* **Ressourcenschonend:** Wird asynchron ausgeführt (standardmäßig alle 3 Stunden).

---

# Installation 

## Automatisch

### Installationscript quick-install.sh

Hinweis: wget muss auf dem System installiert sein

```bash
wget -O - "https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/quick-install.sh" | sh
```

Danach mit Schritt 4 der manuellen Installation fortfahren.


## Manuell

### 1. Verzeichnis auf dem Froxlor-Server anlegen
Erstelle das Verzeichnis für das 3-Stunden-Intervall (**10800 Sekunden**) im Local-Ordner des Checkmk-Agenten:

```bash
mkdir -p /usr/lib/check_mk_agent/local/10800
```

### 2. Skript herunterladen
Lade das Skript direkt in das eben erstellte Verzeichnis herunter.

**Über wget:**
```bash
wget -O /usr/lib/check_mk_agent/local/10800/froxlor_version "https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/froxlor_version"
```

**Alternativ über curl:**
```bash
curl -o /usr/lib/check_mk_agent/local/10800/froxlor_version "https://raw.githubusercontent.com/agentur2c/checkmk-froxlor/refs/heads/main/froxlor_version"
```

### 3. Ausführungsrechte vergeben
Damit der Checkmk-Agent das Skript ausführen kann, müssen die Rechte angepasst werden:

```bash
chmod +x /usr/lib/check_mk_agent/local/10800/froxlor_version
```

### 4. In Checkmk einbinden
1. Wechsle in die **Checkmk Web-Oberfläche**.
2. Rufe die **Setup / Service Discovery** (Service-Erkennung) des betroffenen Hosts auf.
3. Checkmk erkennt den neuen Service `"Froxlor Version"` automatisch.
4. Übernehme den Service mit **Accept all** und aktiviere die Änderungen (**Changes aktivieren**).

---

## Funktionsweise & Cache
Da der Check im Ordner `10800` liegt, führt der Checkmk-Agent das Skript nur **alle 3 Stunden** im Hintergrund aus und cacht das Ergebnis. Bei den minütlichen Abfragen liest Checkmk blitzschnell den Cache aus, um die Serverlast zu minimieren. 

In der Detailansicht des Services siehst Du daher transparente Systemmeldungen wie:
* `Cache generated X minutes ago`
* `cache interval: 3 hours 0 minutes`

## Lizenz usw.
Provided as is - use it on your own risk :-)
