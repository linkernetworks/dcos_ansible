#!/bin/bash

echo "deploy..."
ansible-playbook -i hosts deploy.yml --verbose
