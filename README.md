ansible-arista-automation-examples 
==================================

```
$ docker import ./images/cEOS64-lab-4.29.0.2F.tar ceos:4.29.0.2F
sha256:5523992a88637ee3a93ec5c7278ab48871bd45cbc7b53f8c443dafadec6dc8c3

$ docker images ceos
REPOSITORY   TAG         IMAGE ID       CREATED          SIZE
ceos         4.29.0.2F   5523992a8863   13 seconds ago   2.04GB
```

```
$ docker-compose up -d
[+] Running 7/7
 ⠿ Network ansible-arista-automation-examples_net13      Created 0.1s
 ⠿ Network ansible-arista-automation-examples_net23      Created 0.1s
 ⠿ Network ansible-arista-automation-examples_mgmt       Created 0.0s
 ⠿ Network ansible-arista-automation-examples_net12      Created 0.0s
 ⠿ Container ansible-arista-automation-examples-ceos1-1  Started 1.1s
 ⠿ Container ansible-arista-automation-examples-ceos2-1  Started 2.0s
 ⠿ Container ansible-arista-automation-examples-ceos3-1  Started 1.3s

$ docker-compose ps
NAME                                         COMMAND                  SERVICE             STATUS              PORTS
ansible-arista-automation-examples-ceos1-1   "/sbin/init systemd.…"   ceos1               running             0.0.0.0:10122->22/tcp, :::10122->22/tcp
ansible-arista-automation-examples-ceos2-1   "/sbin/init systemd.…"   ceos2               running             0.0.0.0:10222->22/tcp, :::10222->22/tcp
ansible-arista-automation-examples-ceos3-1   "/sbin/init systemd.…"   ceos3               running             0.0.0.0:10322->22/tcp, :::10322->22/tcp
```

```
$ docker-compose exec ceos1 Cli
ceos1>enable
ceos1#zerotouch disable 
ceos1#config
ceos1(config)#username admin secret arista
ceos1(config)#write memory 
Copy completed successfully.
ceos1(config)#exit
ceos1#exit
```

```
$ pipenv install
$ pipenv shell
$ ansible-playbook -i inventories/development/hosts.ini playbooks/eos.yml
```
