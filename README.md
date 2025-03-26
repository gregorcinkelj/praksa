# praksa

## Namesti docker

```bash
curl https://get.docker.com | sudo bash -
sudo usermod -aG docker $USER
# odjava, prijava nujno da se skupina osveži
groups  # tole mora it v skupino
```

testiranje če docker dela

```bash
sudo docker run hello-world
docker run hello-world
```

## Pozeni docker compose

```bash
git clone git@github.com:gregorcinkelj/praksa.git
cd praksa

# kaj naj zdaj naredim?
#naredi deploy.sh executible
chmod +x deploy.sh

#zaženi deploy.sh
./deploy.sh
```



Testiranje če nginx works.
odpri povezavo http://localhost ali https://localhost.
ali zaženem

```bash
curl http://localhost
curl -k https://localhost
```

če to dela, potem kode dela.
Nato lahko poizkusim prilagoditi vsebino HTML-ja itd.
