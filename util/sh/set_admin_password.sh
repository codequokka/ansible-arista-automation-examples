#!/bin/bash

commands="enable
config
username admin secret arista
write memory
"

docker-compose -f docker/docker-compose/env1/docker-compose.yml exec ceos1 Cli -p 15 -e -c "$commands"
docker-compose -f docker/docker-compose/env1/docker-compose.yml exec ceos2 Cli -p 15 -e -c "$commands"
docker-compose -f docker/docker-compose/env1/docker-compose.yml exec ceos3 Cli -p 15 -e -c "$commands"

docker-compose -f docker/docker-compose/env2/docker-compose.yml exec ceos4 Cli -p 15 -e -c "$commands"
docker-compose -f docker/docker-compose/env2/docker-compose.yml exec ceos5 Cli -p 15 -e -c "$commands"
docker-compose -f docker/docker-compose/env2/docker-compose.yml exec ceos6 Cli -p 15 -e -c "$commands"
