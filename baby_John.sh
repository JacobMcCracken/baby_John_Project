#!/bin/bash
#############################################################################################
echo "Please select a mode or other options."
OPTIONS="Single Incremental Wordlist Extrenal OtherOptions Quit"
IOPTIONS="ASCII LM_ASCII ALPHANUMERIC ALPHA_CHARS LOWERNUM UPPERNUM LOWERSPACE  "
select opt in $OPTIONS; do

#############################################################################################
#Quit
	if [ "$opt" = "Quit" ]; then
		echo done
		exit

#############################################################################################
#SINGLE
	elif [ "$opt" = "Single" ]; then
		echo "Please enter the username of the account you would like to crack."
		read account
		echo "Please enter the target for the single crack"
		read target
		john --single -u=$account $target

#############################################################################################	
#Incremental
	elif [ "$opt" = "Incremental" ]; then
		echo "Please enter the username of the account you would like to crack"
		echo "or enter ALL to attempt to crack all accounts in the target file"
		read account
		echo "Please select an inciemental mode."
		select opt in $IOPTIONS; do
		if [ $account == "ALL" [; then
			echo "Please enter the target for the single crack"

		else
			echo "Please enter the target for the single crack"
			read target
			
		fi

#############################################################################################
#Wordlist
	elif [ "$opt" = "Wordlist" ]; then
		echo ""

#############################################################################################
#External
	elif [ "$opt" = "External" ]; then
		echo ""

#############################################################################################
#OtherOptions
	elif [ "$opt" = "OtherOptions" ]; then
		echo ""

#############################################################################################
#BadOption
	else
		clear
		echo bad option
	fi
done
