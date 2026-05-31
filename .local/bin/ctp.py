#!/usr/bin/python

import subprocess
import netifaces as ni
import argparse

parser = argparse.ArgumentParser(description='scp wrapper')
parser.add_argument('files', nargs='+', help='file(s) to copy')

def get_ip_server():
    gateways = ni.gateways()
    default_gateways = gateways['default'][ni.AF_INET][0]
    return default_gateways

def scp(files: list[str], target_file: str):
    # Jalankan scp dengan semua file
    result = subprocess.run(['scp', '-P', '2222', *files, target_file])
    return result

if __name__ == '__main__':
    args = parser.parse_args()

    username = 'akmal'
    ip = get_ip_server()

    files = args.files
    target_file = f'{username}@{ip}:/sdcard/Computer'

    scp(files, target_file)
