DULL='\033[0m'
GREEN='\033[5;32m'
CYAN='\033[5;36m'

func_commit()
{
echo "commit: "
read mymessage
if [ $mymessage = 'EXIT' ]
then
	exit
elif [$mymessage = 'SKIP' ]
then
	echo You can only skip the \'git add\' stage
	echo Your message will now be taken word-for-word
	read mymessage
fi
git commit -m "$mymessage"
}

func_add()
{
echo "\a\nYou can type \"${GREEN}SKIP${DULL}\" to move on to the commit stage"
echo "Or you can type \"${CYAN}EXIT${DULL}\" to exit the script\n"
echo git add: 
read myfile
if [ $myfile = 'SKIP' ]
then
	func_commit
elif [ $myfile = 'EXIT' ]
then
	exit
else
	git add $myfile
	func_commit
fi
}

clear

ls -a -l

git status

func_add

clear
git status

echo "push? [y/n]"

read myconfirmation

if [ $myconfirmation = 'y' ] || [ $myconfirmation = 'Y' ] || [ $myconfirmation = 'yes' ] || [ $myconfirmation = 'Yes' ]
then
		echo "Attempting push\n"
		git push origin master
		git log
elif [ $myconfirmation = 'n' ] || [ $myconfirmation = 'N' ] || [ $myconfirmation = 'no' ] || [ $myconfirmation = 'No' ]
then
		echo "not pushed\n"
		git reset --soft HEAD^ 		#REMOVES COMMIT MESSAGE
		git reset HEAD			#UNSTAGES (REMOVES FILE FROM HEAD INDEX)
fi
