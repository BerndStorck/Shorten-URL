#!/bin/bash
#
# shorten_url.sh

url="$1"

# Ueberpruefen, ob eine URL als Parameter uebergeben wurde:
if [ -z "$url" ]; then
  echo "FEHLER: Beim Programmstart die URL, die gekürzt werden soll, als Parameter übergeben!"
  read -rp "Welche Web-Adresse soll gekürzt werden? " url
  if [ -z "$url" ]; then
    echo "FEHLER: Das Programm kann keine Web-Adresse kürzen, wenn ihm keine übergeben wird."
    echo "Abbruch."
    exit 1
  fi
fi

# URL verkuerzen
short_url=$(curl -s "http://tinyurl.com/api-create.php?url=$url")

# Verkuerzte URL ausgeben
echo "Verkuerzte URL: $short_url"

# Verkuerzte URL in die Zwischenablage kopieren (fuer Linux)
echo "$short_url" | xclip -selection clipboard

# Fuer macOS kann stattdessen pbcopy verwendet werden:
# echo "$short_url" | pbcopy
