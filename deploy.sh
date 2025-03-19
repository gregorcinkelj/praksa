#!/bin/bash

# Naloži spremenljivke iz deploy.conf
source deploy.conf

#make new directory incase there is no directory
[ -d html ] || mkdir html

#writes info  into index.html
echo "$HTML_CONTENT" > html/index.html


#runs docker compose
sudo docker compose docker-compose.yml up -d
