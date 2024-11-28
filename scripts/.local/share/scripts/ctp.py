#!/usr/bin/python

import subprocess
import netifaces as ni
import argparse

parser = argparse.ArgumentParser(description='scp wrapper')
parser.add_argument('file', type=str, help='file to copy')

def get_ip_server():
    gateways = ni.gateways()
    default_gateways = gateways['default'][ni.AF_INET][0]

    return default_gateways

def scp(source_file: str, target_file: str):
    result = subprocess.run(['scp', '-P', '2222', source_file, target_file])

if __name__ == '__main__':
    args = parser.parse_args()

    username = 'akmal'
    ip = get_ip_server()

    source_file = args.file
    target_file = f'{username}@{ip}:/sdcard/Computer'

    scp(source_file, target_file)
