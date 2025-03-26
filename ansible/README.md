
# Povezave do Ansible pomoči
https://www.redhat.com/en/blog/quadlet-podman

https://docs.ansible.com/ansible/latest/collections/containers/podman/podman_container_module.html

## 1. Namestitev Ansible v Ubuntu

Odprite terminal in vnesite:

```bash
sudo apt-add-repository ppa:ansible/ansible
```

Osvežite sistemske pakete, da bo sistem zaznal nove pakete v PPA:

```bash
sudo apt update
```

Za namestitev Ansible vnesite:
```bash
sudo apt install ansible
```

## 2. Postavitev inventory datoteke
Uporabite lahko privzeto lokacijo:

```bash
sudo nano /etc/ansible/hosts
```

ali pa ustvarite svojo datoteko v domači mapi:

```bash
sudo nano /home/user/ansible/inventory.ini
```

V urejevalnik nano lahko vnesete strežnike brez skupine ali z njo.
Vedno uporabite ustrezne IP-naslove računalnikov, oblaka ali virtualnih strojev.

Brez skupine:
```bash
203.0.113.111
203.0.113.112
203.0.113.113
```

S skupino:

```bash
[servers]
203.0.113.111
203.0.113.112
203.0.113.113
```


## 3. Testiranje povezave

Ko je inventory nastavljen, iz lokalnega sistema zaženite:

```bash
ansible all -m ping -u xlab
```

To bo preverilo:

- ali so strežniki dosegljivi,

- ali so poverilnice za SSH pravilne,

- ali lahko Ansible izvaja module na strežnikih (Python mora biti nameščen).

## 4. Obvezna namestitev dodatkov

Pred zagonom playbook-a je treba namestiti naslednje collections:

```bash
ansible-galaxy collection install containers.podman

ansible-galaxy collection install community.docker
```
Brez tega playbook ne bo deloval.


## 5. Zagoni playbook-a
Za zagon playbook-a uporabite naslednji ukaz. Pazite, da se ime uporabnika ujema v playbook-u in inventory. V tem primeru je ansible_user=xlab.

```bash
ansible-playbook -i ansible/inventory ansible/docker-podman-deploy.yml
```
