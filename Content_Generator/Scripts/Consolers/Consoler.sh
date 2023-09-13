#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Parses All CSV in Source Directories
# Note : We can have a Special File named Symbols which will always be parsed first than all other CSVs and That must not Contain any Extention too. ( The name must be Symbols only ) 
# Generates Console Presentable Content From These Sources

if [ $# -lt 1 ]
then
	echo -e "\n\tPlease Specify Directory Containing information CSVs."
	echo -e "\n\t\tExample \n\t\t\t $0 ../../Git/Source/ \n"
	exit
fi

Current_Path=`dirname $0`
TITLE=""

if [[ -f $1/title.html ]]
then
		TITLE=`cat $1/title.html`
fi

SYMBOLS=$1/Symbols

echo
echo $'\E[1;38m' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% $'\E[0m'
echo -e "\n\n\t\t" $'\E[1;36m' $TITLE $'\E[0m' "\n\n"
echo

if [[ -f $SYMBOLS  ]]
then
	$Current_Path/CSVParser.sh $SYMBOLS
fi

#echo $HELP_DOCUMENT
for csv in `ls $1/*[cC][Ss][Vv]`
do
	echo $'\E[1;32m' ------------------------------------------------------------------------------------------------ $'\E[0m'
	$Current_Path/CSVParser.sh $csv
done

echo $'\E[1;38m' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% $'\E[0m'
echo
