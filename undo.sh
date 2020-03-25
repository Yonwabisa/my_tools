echo "unset PSH
mv /dev/gitpusher_v3.sh .
alias psh=\"echo this alias has been cleared and is reserved\"" > temp2.sh
chmod +x ./temp2.sh
. ./temp2.sh
rm ./temp2.sh
clear
ls
