## 1. Namestitev Ansible v Ubuntu

Odpremo terminal in vnesemo.

```bash
sudo apt-add-repository ppa:ansible/ansible
```

Osvežimo sistemske pakete, da ve da so nove pakete dodane v ppa:.

```bash
sudo apt update
```

Namestitev ansible vnesemo.
```bash
sudo apt install ansible
```

## 2. postaviti inventory datoteke

lahko uporabimo orginal lokacijo 

```bash
sudo nano /etc/ansible/hosts
```

ali pa naredimo svojo in uporabite svojo ime od uporabnika

```bash
sudo nano /home/user/ansible/inventory.ini
```

v nano napišemo lahko brez skupine ali s skupini
zmeraj uporabi ta ip address na kateri so te računalniki/cloud/virtual

brez skupine
```bash
203.0.113.111
203.0.113.112
203.0.113.113
```

s skupino

```bash
[servers]
203.0.113.111
203.0.113.112
203.0.113.113
```


## 3. testiranje povezave

ko smo postavili inventory. iz lokalne zaženemo

```bash
ansible all -m ping -u root
```

to bo testiral: 
- če host ji lahko dobi
- če so taprave SSH credentials
- če host lahko zažene ansible module ki uporablja python


## 4. zagoni playbook
če bi želeli zaženiti moj playbook. ampak pazite na ime ki ga boste dali v playbook in inventory. v mojem primeru je so v playbook in inventory ansible_user=xlab

```bash
ansible-playbook -i ansible/inventory ansible/docker-podman-deploy.yml
```