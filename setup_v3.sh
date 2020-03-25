#!/bin/bash
echo "mv ./gitpusher_v3.sh /dev
export PSH=\"sh /dev/gitpusher_v3.sh\"
alias psh=\"\$PSH\"" > temp1.sh
source ./temp1.sh
rm ./temp1.sh
clear && ls
