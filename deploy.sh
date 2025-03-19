#!/bin/bash

# Make sure we're in the correct directory (where the script is located)
cd "$(dirname "$0")"

ansible-playbook -i ansible/ansible-inventory.ini ansible/docker-podman-deploy.yml
