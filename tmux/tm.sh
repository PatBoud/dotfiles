#!/bin/sh

# Script de lancement de tmux avec mes dispositions préférées

# PatBoud
# 2022-05-27

# INFORMATIONS
# send-keys 'my-command' C-m  : Exécute une commande:
# \;                          : Envoie le ; à tmux plutôt qu'à bash. Permets de lancer toutes les
#                               commandes en une seule opération


# Window 1 (PatBoud)
# _______________________
# |  log                |
# |_____________________|
# |               |     |
# |  >            |htop |
# |_______________|     |
# |  >            |     |
# |_______________|_____|

# Log du serveur web en haut
# split-window -v -p 85 \; \    # Donne 85% en bas,              donc 15% en haut pour log
# split-window -h -p 25 \; \    # Donne 25% à droite pour htop,  donc 75% à gauche
# split-window -v -p 25 \; \    # Donne 25% en bas pour bash     donc 75% en haut pour bash


# Window 2 (Edition)
# _______________________
# |  >       | >        |
# |          |          |
# |          |          |
# |          |          |
# |__________|__________|
# |  >                  |
# |_____________________|

# split-window -v -p 20 \; \    # Donne 20% en bas,              donc 80% en haut
# split-window -h \; \          # Donne 50% à gauche et à droite


tmux new-session -s patboud \; \
  rename-window PatBoud \; \
  send-keys 'tail -f /docker/webstack/nginx/logs/access.log' C-m \; \
  split-window -v -p 85 \; \
  split-window -h -p 25 \; \
  send-keys 'htop' C-m \; \
  select-pane -t 2 \; \
  split-window -v -p 25 \; \
  select-pane -t 2 \; \
  new-window \; \
  rename-window Edition \; \
  split-window -v -p 20 \; \
  select-pane -t 1 \; \
  split-window -h \; \
  select-pane -t 1 \; \
  select-window -t 1 \;
