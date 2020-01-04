#!/bin/bash

## working from : http://matt.might.net/articles/bash-by-example/
## https://stackoverflow.com/questions/37205010/wait-one-process-to-finish-and-execute-another-process : use time before command
set -e

echo  installing $1
echo stopping logstash
docker-compose stop logstash &
wait $!
echo change conf file to $1
cp $1.conf pipeline/logstash.conf &
wait $!
echo inserting $1 files

#echo installing $2 files

#head -$2 ~/elastic-search/$1.json > ~/dev_serverless/docker-elk/mydata/mongodb.json &

cat  ~/elastic-search/$1.json > ~/dev_serverless/docker-elk/mydata/mongodb.json &

wait $!
echo ""
echo starting logstash
docker-compose start logstash &

wait
echo ""
echo logstash has started

sleep 180 &

wait
echo ""
echo 3 minutes later
echo ""
