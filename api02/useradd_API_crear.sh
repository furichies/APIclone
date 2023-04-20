#!/bin/bash

ip=$1
nombre=$2
uid=$3
cargo=$4
nomina=$5

json='{"nombre": "'$nombre'", "uid": "'$uid'", "cargo": "'$cargo'", "nómina": "'$nomina'"}'

curl -X POST -H "Content-Type: application/json" -d "$json" "http://$ip:7001/users"
