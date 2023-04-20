#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <direccion_ip>"
    exit 1
fi

ip=$1
curl -s "http://${ip}:7002/users" | json_pp 
