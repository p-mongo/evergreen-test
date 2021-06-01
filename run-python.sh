#!/bin/bash

set -e

export PATH=/opt/python/3.6/bin:$PATH

python3 -V

pip3 install requests --user

env

python3 request-test.py
