#!/bin/bash

# Script de MOTD personnalisé.
#
# Copier   motd.sh   dans le dossier /etc/profile.d/
# Rendre   motd.sh   avec la commande sudo chmod +x /etc/profile.d/motd.sh
#
# Copier   motd.txt  dans le dossier /etc/profile.d/
# Modifier motd.txt  pour qu'il contienne un message/dessin ASCII personnalisé
# Dans mon cas, le MOTD est le hostname en ASCII
#   http://www.network-science.de/ascii/
#   FONT: big


# Définition des couleurs
# Codes de couleur: https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
VERT="\e[0;38;5;34m"
GRIS="\e[0;38;5;249m"
ORANGE="\e[0;38;5;179m"
BLEU="\e[0;38;5;32m"

RESET="\e[39;49m"


##### Obtention d'informations système #####

# Adresse iP
IP=$(hostname -i)

# Uptime
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UPTIME=`printf "%d jours, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# Utilisation du CPU
read one five fifteen rest < /proc/loadavg

# Espace disque de /
DISKUSED=$(df -hP / | awk '{print $3}' |tail -1|sed 's/%$//g')
DISKFREE=$(df -hP / | awk '{print $4}' |tail -1|sed 's/%$//g')
DISKSIZE=$(df -hP / | awk '{print $2}' |tail -1|sed 's/%$//g')
DISKPCT=$(df -hP / | awk '{print $5}' |tail -1|sed 's/%$//g')




# Affichage de la ligne précédant le ASCII, suivi de la couleur du MOTD
# Longueur: 48 caractères
echo -e "${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}"


# Affichage du fichier contenant le MOTD
while IFS= read -r ligne
do
  echo -e "$ligne"
done < /etc/profile.d/motd.txt


# Affichage de la ligne suivant le MOTD
# Longueur: 48 caractères
echo -e "${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##${ORANGE}##${GRIS}##"


# Affichage des informations système
echo -e ${GRIS}$(uname -srmo)
echo ""
echo -e "${VERT}IP${GRIS}......... ${BLEU}$IP"
echo -e "${VERT}Uptime${GRIS}..... ${BLEU}$UPTIME"
echo -e "${VERT}Charge${GRIS}..... ${BLEU}${one}${GRIS}, ${BLEU}${five}${GRIS}, ${BLEU}${fifteen} ${GRIS}(1, 5, 15 min)"
echo -e "${VERT}Disque${GRIS}......${BLEU}${DISKUSED}${GRIS} / ${BLEU}${DISKSIZE} ${GRIS}(${BLEU}${DISKPCT}%${GRIS})"

echo -e "${GRIS}------------------------------------------------"
echo ""