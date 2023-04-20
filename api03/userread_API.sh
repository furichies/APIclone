#!/usr/bin/python3
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/users', methods=['GET'])
def get_users():
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
