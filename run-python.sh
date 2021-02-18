#!/bin/bash

set -e

python3 -V

pip3 install requests --user

python3 request-test.py
