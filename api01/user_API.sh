#!/usr/bin/python3
from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/users/<username>', methods=['GET'])
def get_user_info(username):
    passwd_output = subprocess.check_output(['getent', 'passwd', username])
    passwd_output = passwd_output.decode('utf-8').strip()
    passwd_fields = passwd_output.split(':')
    return jsonify({
        'username': passwd_fields[0],
        'password': passwd_fields[1],
        'uid': passwd_fields[2],
        'gid': passwd_fields[3],
        'gecos': passwd_fields[4],
        'home_directory': passwd_fields[5],
        'shell': passwd_fields[6]
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7000)
