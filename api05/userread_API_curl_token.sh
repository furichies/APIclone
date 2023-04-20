#!/bin/bash
IP=$1
TOKEN=$2
curl -X GET "http://$IP:7002/users?token=$TOKEN"
