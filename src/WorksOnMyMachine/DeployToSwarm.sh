﻿#!/bin/bash

# The authentication part is just a PoC.
eval `ssh-agent`
ssh-add $ACS_SSHKEY

scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/docker-compose.yml $ACS_MASTER0:~/docker-compose.yml
scp -P 2200 $BUILD_SOURCESDIRECTORY/src/WorksOnMyMachine/RunOnSwarm.sh $ACS_MASTER0:~/RunOnSwarm.sh
ssh $ACS_MASTER0 -A -p 2200 'chmod +x ~/RunOnSwarm.sh && ~/RunOnSwarm.sh'
