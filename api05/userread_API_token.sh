#!/usr/bin/python3
from flask import Flask, jsonify, request

app = Flask(__name__)

TOKEN_FILE = '/tmp/tokens'

def validate_token(token):
    with open(TOKEN_FILE, 'r') as f:
        tokens = f.read().splitlines()
        if token in tokens:
            return True
        else:
            return False

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

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7002)
