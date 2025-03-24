#!/bin/bash

# Naloži spremenljivke iz deploy.conf
source deploy.conf

#make new directory incase there is no directory
[ -d html ] || mkdir html
[ -d certs ] || mkdir certs
[ -d conf.d ] || mkdir conf.d

#copys certs and key into certs directory
cp nginx.crt ./certs && cp nginx.key ./certs

#copy's default.conf into conf.d directory
cp default.conf ./conf.d

#writes info  into index.html
echo "$HTML_CONTENT" > html/index.html


#runs docker compose
sudo docker compose up -d
