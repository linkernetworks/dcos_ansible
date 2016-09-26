#!/bin/bash

#download dc/os installer
if [ ! -f "roles/deploy/files/dcos_generate_config.sh" ]; then
        echo "beforedeploy:------download dcos_generate_config.sh"
        curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh
	echo "beforedeploy:------move dcos_generate_config.sh to roles/deploy/files/"
	mv dcos_generate_config.sh roles/deploy/files/dcos_generate_config.sh
else
	echo "beforedeploy:------dcos_generate_config.sh existed"
fi

#copy config.yaml to roles/deploy/templates/
echo "beforedeploy:------copy config.yaml to roles/deploy/templates/"
cp config.yaml roles/deploy/templates/config.yaml

#copy ssh_key to roles/deploy/files/
echo "beforedeploy:------copy ssh_key to roles/deploy/files/"
cp ssh_key roles/deploy/files/ssh_key
