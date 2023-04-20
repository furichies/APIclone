#!/bin/bash

ip=$1
user=$2

curl "http://$ip:7000/users/$user"
