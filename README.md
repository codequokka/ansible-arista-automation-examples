ansible-arista-automation-examples 
==================================

```
     e1 +-----+ e2
   +----+ceos1+----+
   |    +-----+    |
   | e1         e1 |
+--+--+         +--+--+
|ceos2+---------+ceos3|
+-----+ e2   e2 +-----+
```

```
$ docker import ./images/cEOS64-lab-4.29.0.2F.tar.xz ceos:4.29.0.2F
sha256:5523992a88637ee3a93ec5c7278ab48871bd45cbc7b53f8c443dafadec6dc8c3

$ docker images ceos
REPOSITORY   TAG         IMAGE ID       CREATED          SIZE
ceos         4.29.0.2F   5523992a8863   13 seconds ago   2.04GB
```

```
$ docker-compose -f docker/docker-compose/env1/docker-compose.yml up -d
[+] Running 7/7
 ⠿ Network env1_mgmt       Created  0.0s
 ⠿ Network env1_net12      Created  0.1s
 ⠿ Network env1_net23      Created  0.1s
 ⠿ Network env1_net13      Created  0.1s
 ⠿ Container env1-ceos3-1  Started  2.1s
 ⠿ Container env1-ceos1-1  Started  1.9s
 ⠿ Container env1-ceos2-1  Started  1.7s

$ docker-compose -f docker/docker-compose/env2/docker-compose.yml up -d
[+] Running 7/7
 ⠿ Network env2_net23      Created  0.0s
 ⠿ Network env2_net13      Created  0.1s
 ⠿ Network env2_mgmt       Created  0.1s
 ⠿ Network env2_net12      Created  0.1s
 ⠿ Container env2-ceos4-1  Started  1.5s
 ⠿ Container env2-ceos6-1  Started  1.7s
 ⠿ Container env2-ceos5-1  Started  1.2s

$ docker-compose ls
NAME                STATUS              CONFIG FILES
env1                running(3)          /home/nbchk/work/github.com/codequokka/ansible-arista-automation-examples/docker/docker-compose/env1/docker-compose.yml
env2                running(3)          /home/nbchk/work/github.com/codequokka/ansible-arista-automation-examples/docker/docker-compose/env2/docker-compose.yml
```

```
$ util/sh/set_admin_password.sh    
#write memory
Copy completed successfully.
#write memory
Copy completed successfully.
#write memory
Copy completed successfully.
#write memory
Copy completed successfully.
#write memory
Copy completed successfully.
#write memory
Copy completed successfully.
```

```
$ pipenv install
$ pipenv shell
$ ansible-playbook -i inventories/cli/hosts.ini playbooks/eos.yml --tags=setup
```
