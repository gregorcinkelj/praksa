# praksa

narediti treba je direktoije certs, conf.d za html ti naredi sam razen ce obstaja

datoteke kot so nginx.crt in nginx.key gredo v certs.
datoteka default.conf gre v conf.d








Navodila za namestitev in zagon Nginx s podporo za SSL v Dockerju

Posodobitev repozitorijev v Ubuntu

Začnemo s posodobitvijo repozitorijev:

sudo apt update

(s tem zagotovimo, da so vsi paketi posodobljeni)

Namestitev Docker Engine

Namestimo Docker Engine in potrebne dodatke:

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

(s tem namestimo tudi Docker Compose v obliki vtičnika)

Če že imamo nameščeno starejšo različico Dockerja, jo odstranimo z naslednjim ukazom:

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

Ustvarjanje direktorija za projekt

Ko imamo nameščen Docker Engine, ustvarimo direktorij, kjer bomo shranili naše datoteke:

mkdir docker

Nato odpremo datoteko docker-compose.yaml v urejevalniku nano:

nano docker-compose.yaml

V datoteko vnesemo naslednjo konfiguracijo:

services:
  proxy:
    image: nginx:latest  # To je izbrana slika (image) Nginx
    ports:
      - "80:80"   # Odpre port 80
      - "443:443" # Odpre port 443
    volumes:  # Pove Dockerju, kje so mape, ki jih bo povezal v container
      - ./html:/usr/share/nginx/html:ro  # Mapa mora vsebovati datoteke, sicer bo prazna
      - ./conf.d:/etc/nginx/conf.d
      - ./certs:/etc/nginx/certs
    restart: always  # Container se ponovno zažene ob ponovnem zagonu sistema

Ustvarjanje konfiguracijske datoteke

Ustvarimo datoteko deploy.conf:

nano deploy.conf

Vanjo vnesemo:

#HTML_CONTENT="<html><body><h1>Hello World</h1></body></html>"

(vsebina strani se shrani v spremenljivko HTML_CONTENT)

Ustvarjanje SSL certifikata

Lahko uporabimo obstoječ (self-signed) certifikat ali pa ustvarimo svojega.Najprej ustvarimo mapo certs:

mkdir -p ./certs

Nato ustvarimo SSL certifikat:

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/nginx.key -out ./certs/nginx.crt

Sledimo navodilom in vnesemo zahtevane podatke.

Konfiguracija Nginx

Ustvarimo mapo conf.d in odpremo novo datoteko default.conf:

mkdir conf.d && nano ./conf.d/default.conf

Vanjo vnesemo naslednjo vsebino:

server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}

server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/certs/nginx.crt;
    ssl_certificate_key /etc/nginx/certs/nginx.key;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}

Shrani in zapri nano.

Ustvarjanje deploy.sh skripte

Sedaj ustvarimo skripto deploy.sh:

nano deploy.sh

Vanjo vnesemo:

#!/bin/bash

# Naloži spremenljivke iz deploy.conf
source deploy.conf

# Ustvari mapo 'html', če ne obstaja
[ -d html ] || mkdir html

# Zapiše vsebino v index.html
echo "$HTML_CONTENT" > html/index.html

# Zažene Docker Compose
sudo docker compose up

Shrani in zapri nano.

Zagon skripte

Na koncu zaženemo skripto:

./deploy.sh

