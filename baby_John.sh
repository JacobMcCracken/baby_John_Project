#!/bin/bash
echo "Please select a mode or other options."
OPTIONS="Single Incremental Wordlist Extrenal OtherOptions Quit"
select opt in $OPTIONS; do
	if [ "$opt" = "Quit" ]; then
		echo done
		exit
	elif [ "$opt" = "Single" ]; then
		echo ""
	elif [ "$opt" = "Incremental" ]; then
		echo ""
	elif [ "$opt" = "Wordlist" ]; then
		echo ""
	elif [ "$opt" = "External" ]; then
		echo ""
	elif [ "$opt" = "OtherOptions" ]; then
		echo ""
	else
		clear
		echo bad option
	fi
done
