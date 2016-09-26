#!/bin/bash

echo "add node..."
ansible-playbook -i hosts add.yml --verbose
