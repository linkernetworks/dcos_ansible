# dcos_ansible
## requirements
- centos 7
- ansible installed

## deploy
**files to be config**
- hosts
- config.yaml
- group_vars/all
- ssh_key

*group_vars/all:*
```yaml
---
network: enp0s8
clustername: dcos
sshuser: root
```
network represents for name of private network used in the cluster.

*hosts:*
```
[bootstrap]
192.168.56.104
[masters]
192.168.56.106
[agents]
192.168.56.103
#ips...
[add]
192.168.56.107
```
replace ip under each role with your own ip.

*config.yaml:*
```yaml
---
agent_list:
- 192.168.56.103
- 192.168.56.107
bootstrap_url: file:///opt/dcos_install_tmp
cluster_name: {{clustername}}
exhibitor_storage_backend: static
ip_detect_filename: /genconf/ip-detect
master_discovery: static
master_list:
- 192.168.56.106
process_timeout: 10000
resolvers:
- 8.8.8.8
- 114.114.114.114
ssh_port: 22
ssh_user: {{sshuser}}
```
config `agent_list` and `master_list` in *config.yaml*

*ssh_key*  
replace *ssh_key* with your own private key rename it *ssh_key*.

-------------------------------------------------------------------------
after configration, run   
`sh beforeDeploy.sh ` and `sh deploy.sh` to start deploy.
## add node
you need a *dcos-install.tar* file to add nodes to a deployed cluster, which you may backup when deploying cluster. if you don't have it, `ssh` to bootstrap node, change directory into `genconf/serve`, run  
`sudo tar cf dcos-install.tar *`, and `scp` the new created *dcos-install.tar* file to `/tmp/{{ clustername }}/dcos-install.tar` directory of the node you installed ansible.

**files to be config**
- hosts

*hosts*  
add the ip to be added under `[add]`

-----------------------------------------------------------------------
after configration, run 
`sh add.sh` to start add node.





