#!/bin/bash

set -e

echo ""
echo autodeleting all indices
echo ""
sleep 10 &
wait $!

./no_password_delete_elastic_indices.sh*

echo begin installing all the collections into elasticsearch
echo ""

./install_json.sh* users

sleep 12 &

wait $!


./install_json.sh* questions

sleep 12 &

wait $!

./install_json.sh* lessons

sleep 180 &

wait $!

./install_json.sh* reports

sleep 10 &

wait $!

echo all collections installed
