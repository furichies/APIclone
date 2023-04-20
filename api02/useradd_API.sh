#!/usr/bin/python3
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/users', methods=['POST'])
def add_user():
    data = request.get_json()
    fields = ['nombre', 'uid', 'cargo', 'nómina']

    with open('/tmp/basedatos', 'a') as f:
        values = [data.get(field, '') for field in fields]
        line = ':'.join(values) + '\n'
        f.write(line)

    return jsonify({'message': 'usuario agregado'}), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7001)
