# praksa

## Namesti docker

```bash
curl https://get.docker.com | sudo bash -
sudo usermod -aG docker $USER
# logout, login needed, to reload group membership
groups  # this needs to list also docker group
```

Test if docker works

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

#run the deploy.sh
./deploy.sh
```



Test if nginx works.
Open link http://localhost or https://localhost.
Or run

```bash
curl http://localhost
curl -k https://localhost
```

Ce to dela, potem kode dela.
Nato lahko poizkusim prilagoditi vsebino HTML-ja itd.
