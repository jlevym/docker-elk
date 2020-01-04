#!/bin/bash

## using expect: autoexpect -f auto_delete_elastic_indices.sh /home/jeffrey/dev_serverless/docker-elk/logstash/delete_elastic_indices.sh



for indexes in lessons reports
do 
        curl --user elastic -X DELETE "localhost:9200/$indexes"
        echo deleting $indexes indexes
done
