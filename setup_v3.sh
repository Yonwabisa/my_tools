#!/bin/bash
cp ./gitpusher_v3.sh /dev
rm ./gitpusher_v3.sh thing
export PSH="sh /dev/gitpusher_v3.sh"
alias psh="$PSH"
