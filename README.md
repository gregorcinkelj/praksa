# praksa

## Namesti docker

Za namestitev Dockerja zaženite naslednje ukaze:

```bash
curl https://get.docker.com | sudo bash -
sudo usermod -aG docker $USER

#Pomembno: Odjavite se in ponovno prijavite, da se spremembe skupine uveljavijo.

#Preverite, ali je uporabnik v skupini docker:

groups  # Izhod mora vsebovati "docker"
```

## Testiranje Dockerja
Preverite, ali Docker deluje:

```bash
sudo docker run hello-world
docker run hello-world
```

## Zagon Docker Compose
Klonirajte repozitorij in vstopite v mapo projekta:

```bash
git clone git@github.com:gregorcinkelj/praksa.git
cd praksa

#Nastavitev dovoljenj in zagon
#Naredite deploy.sh izvršljivo:

chmod +x deploy.sh

#zaženi deploy.sh
./deploy.sh
```

## Testiranje, ali Nginx deluje
Odprite povezavo v brskalniku:
- HTTP: http://localhost 
- HTTPS: https://localhost.

Ali preverite s curl:

```bash
curl http://localhost
curl -k https://localhost
```

Če dobite odgovor, potem koda deluje. Nato lahko prilagodite HTML-vsebino po potrebi.


