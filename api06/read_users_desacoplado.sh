#!/usr/bin/python3
from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

TOKEN_API = 'http://localhost:7003/query/'

@app.route('/users', methods=['GET'])
def get_users():
    token = request.args.get('token')
    if not validate_token(token):
        return jsonify({'error': 'Token inválido'}), 401
    with open('/tmp/basedatos') as f:
        lines = f.readlines()
    data = []
    for line in lines:
        fields = line.strip().split(':')
        user = {
            'nombre': fields[0],
            'uid': fields[1],
            'cargo': fields[2],
            'nómina': fields[3],
        }
        data.append(user)
    return jsonify(data)

def validate_token(token):
    response = requests.get(TOKEN_API + token)
    if response.status_code == 200:
        result = response.json().get('result')
        if result:
            return True
        else:
            return False
    else:
        return False

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7002)
