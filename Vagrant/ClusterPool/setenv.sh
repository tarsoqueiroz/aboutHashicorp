#! /bin/bash
# Setting environment

clear
echo -e "### ... ...\n"

# 
export NODES="machine1 machine2 machine3"

for clusterMachine in $NODES
do
  echo -e "===>> Node '${clusterMachine}' <<==="
  rm -rf ./sync.data/${clusterMachine}
  mkdir -p ./sync.data/${clusterMachine}
done
tree -d ./sync.data
