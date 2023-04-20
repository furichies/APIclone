#!/bin/python3
from flask import Flask, jsonify

import random
import string

app = Flask(__name__)

TOKENS_FILE = '/tmp/tokens'

@app.route('/token', methods=['GET'])
def generate_token():
    # Generar un token aleatorio de 5 caracteres
    token = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
    
    # Almacenar el token en el archivo de tokens
    with open(TOKENS_FILE, 'a') as f:
        f.write(token + '\n')
    
    # Devolver el token generado como respuesta en formato JSON
    return jsonify({'token': token})


@app.route('/query/<token>', methods=['GET'])
def query_token(token):
    # Leer el archivo de tokens y verificar si el token solicitado está en él
    with open(TOKENS_FILE, 'r') as f:
        tokens = [line.strip() for line in f.readlines()]
    
    # Devolver True si el token está en el archivo, False si no está
    return jsonify({'result': token in tokens})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7003)
