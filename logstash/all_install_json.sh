#!/bin/bash


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

sleep 120 &

wait $!

echo all collections installed 
