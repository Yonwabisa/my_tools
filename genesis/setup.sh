#!/bin/bash

# Check if the bin folder exists in the home directory
# WeThinkCode Macs already have ~/bin in the $PATH
if [[ -d $HOME/bin ]]; then
    echo bin folder found
else
    echo 'creating bin directory in $HOME'
    mkdir $HOME/bin 
fi

word='differ'
for script in genesis sub_genesis
do
    out=`diff ~/bin/$script $script -q`
    num=`echo $out | grep $word -c`
    if [[ num -ge 1 ]];
    then
        echo 'They differ'
        echo copying $script files to bin
        cp $script $HOME/bin -v
        echo 'done copying'
    else
        echo "$script is up to date"
    fi
done
