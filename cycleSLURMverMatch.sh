##Thanks knowledge share from Mr. Sooyoung Moon

#!/bin/bash

## Run at CycleCloud Server VM
sudo -i
cd /opt/cycle_server
./cycle_server execute 'SELECT * FROM Cloud.Project WHERE Name=="slurm"'

## Check if the Slurm project is the current version, for example 2.4.4. If not, run the following commands(assuming it’s 2.4.1):
./cycle_server execute -format json 'SELECT * FROM Cloud.Project WHERE Name=="slurm" && Version=="2.4.1"' > slurm244.json
sed -i "s/2.4.1/2.4.4/g" slurm244.json
mv slurm244.json config/data/

## Change default slurm.txt template, and import
#[[[cluster-init cyclecloud/slurm:default]]]  >>  [[[cluster-init cyclecloud/slurm:default:2.4.4]]]
#[[[cluster-init cyclecloud/slurm:scheduler]]]  >>  [[[cluster-init cyclecloud/slurm:scheduler:2.4.4]]]
#[[[cluster-init cyclecloud/slurm:execute]]]  >>  [[[cluster-init cyclecloud/slurm:execute:2.4.4]]]
#[[[cluster-init cyclecloud/slurm:execute]]]  >>  [[[cluster-init cyclecloud/slurm:execute:2.4.4]]]

cyclecloud import_template -f slurm.txt --force
