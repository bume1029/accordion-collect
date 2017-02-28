#!/usr/bin/env bash

echo "####################Scouter start#####################"
sed -e 's/CLUSTERIP/'"$CLUSTERIP"'/g' /opt/scouter_server/conf/scouter.conf.tmp > /opt/scouter_server/conf/scouter.conf1
sed -e 's/POD_NAMESPACE/'"$POD_NAMESPACE"'/g' /opt/scouter_server/conf/scouter.conf1 > /opt/scouter_server/conf/scouter.conf2
sed -e 's/SCOUTER_HOST/'"$SCOUTER_HOST"'/g' /opt/scouter_server/conf/scouter.conf2 > /opt/scouter_server/conf/scouter.conf
echo "#######################################################"

cd /opt/scouter_server/
java -Xmx512m -classpath boot.jar scouter.boot.Boot ./lib
