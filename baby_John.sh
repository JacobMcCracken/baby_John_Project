#!/bin/bash
#############################################################################################
#Variables
defaultconf="/home/jacob/baby_John_Project/default_john.conf"
confPATH="/home/jacob/baby_John_Project/test_john.conf"
targetfile="/home/jacob/baby_John_Project/targetfile"
OPTIONS="Single Incremental Wordlist Extrenal OtherOptions Quit"

IOPTIONS="ASCII LM_ASCII Alnum Alpha LowerNum UpperNum LowerSpace Lower Upper Digits Info"
ASCII="ascii.chr\nMinLen = 0\nMaxLen = 13"
LM_ASCII="lm_ascii.chr\nMinLen = 0\nMaxLen = 7"
Alnum="alnum.chr\nMinLen = 1\nMaxLen = 13"
Alpha="alpha.chr\nMinLen = 1\nMaxLen = 13"
LowerNum="lowernum.chr\nMinLen = 1\nMaxLen = 13"
UpperNum="uppernum.chr\nMinLen = 1\nMaxLen = 13"
LowerSpace="lowerspace.chr\nMinLen = 1\nMaxLen = 13"
Lower="lower.chr\nMinLen = 1\nMaxLen = 13"
Upper="upper.chr\nMinLen = 1\nMaxLen = 13"
Digits="digits.chr\nMinLen = 1\nMaxLen = 20"

#############################################################################################

cat $defaultconf > $confPATH
echo "Please select a mode or other options."
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
		echo 'or enter "ALL" to attempt to crack all accounts in the target file'
		read account
		echo "Please enter the minimum length of the password to be cracked."
		read min
		echo "Please enter the maximum length of the password to be cracked."
		read max
		echo "Please enter the target for the incremental crack"
		read target
		if grep -q "$account:"'$0' "$target"
		then
			format="descrypt"
		elif grep -q "$account:"'$1' "$target"
		then	
			format="md5crypt"
		elif grep -q "$account:"'$2' "$target"
		then	
			format="bcrypt"
		elif grep -q "$account:"'$5' "$target"
		then	
			format="sha256crypt"
		elif grep -q "$account:"'$6' "$target"
		then	
			format="sha512crypt"	
		else
			echo "Encryption type could not be detected, please input an encryption type"
			read format	
		fi
		echo "Please select an inciemental mode or choose Info for information"
		echo "on each mode."
		select iopt in $IOPTIONS; do
			if [ "$iopt" = "ASCII" ]; then
				sed -i "s/MinLen = 0/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=ascii --format=$format $target
				else
					john --incremental=ascii --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "LM_ASCII" ]; then
				sed -i "s/MinLen = 0/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 7/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=lm_ascii --format=$format $target
				else
					john --incremental=lm_ascii --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Alnum" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=alnum --format=$format $target
				else
					john --incremental=alnum --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Alpha" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=alpha --format=$format $target
				else
					john --incremental=alpha --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "LowerNum" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=lowernum --format=$format $target
				else
					john --incremental=lowernum --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "UpperNum" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=uppernum --format=$format $target
				else
					john --incremental=uppernum --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "LowerSpace" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=lowerspace --format=$format $target
				else
					john --incremental=lowerspace --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Lower" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=lower --format=$format $target
				else
					john --incremental=lower --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Upper" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 13/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=upper --format=$format $target
				else
					john --incremental=upper --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Digits" ]; then
				sed -i "s/MinLen = 1/MinLen = $min/g" $confPATH
				sed -i "s/MaxLen = 20/MaxLen = $max/g" $confPATH
				if [ "$account" = "ALL" ]; then
					john --incremental=digits --format=$format $target
				else
					john --incremental=digits --format=$format -u=$account $target
				fi
			elif [ "$iopt" = "Info" ]; then
				echo "ASCII - uses all 95 printable ASCII characters"
				echo "LM_ASCII - same as ASCII, used on LM hashes "
				echo "Alnum - uses all 62 alphanumeric characters"
				echo "Alpha - uses all upper and lower case letters"
				echo "LowerNum - uses lowercase letters and digits"
				echo "UpperNum - uses uppercase letters and digits"
				echo "LowerSpace - uses lowercase letters and spaces"
				echo "Lower - uses only all lowercase letters"
				echo "Upper - uses only all uppercase letters"
				echo "Digits - uses only all digits (0-9)"
			fi
		done
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
