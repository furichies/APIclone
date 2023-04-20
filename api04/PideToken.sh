#!/bin/bash

TOKEN=$(curl -s http://localhost:7003/token)
echo "El token es: $TOKEN"
