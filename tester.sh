#!/bin/bash
env | grep -e "^PSH."
echo "environment variables found:"
env | grep -c -e "^PSH."
find /dev/gitpusher_v3.sh -print
echo "done"
