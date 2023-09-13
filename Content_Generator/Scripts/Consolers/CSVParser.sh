#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Parses CSV File and Generate Console Presentable Content Out of it
# Needs CSV Input File as Source

# If Line Starts with #, Just Enter a New Line and Continue
# It is Indication of a New Sub-Topic

# As We are Parsing CSV, Comma will be Treated as Separator.
# If we want Comma, In Generated Content, We can use )^( instead

# As Entire Content for Single Sub-Topic is in Same Line,
# We Can Use Semicolon to have New Line in Generated Content


DARK_BLUE='\033[1;34m'
NC='\033[0m' # No Color

function title() {
  printf "${DARK_BLUE}%s\n${NC}" $* >&2
}

while read Row ;
do
		if [[ $Row =~ ^# ]];
		then
			# If Line Starts with #, Just Enter a New Line and Continue
        	        # It is Indication of a New Sub-Topic
			
			echo
		else
			number_of_commas=`echo ${Row} | grep -o ',' | wc -l`
			
			# The First Column is not Preceeded By Comma
			# So Columns are Commas + 1
			number_of_columns=$(($number_of_commas + 1))
	
			# Debug Statment Below
			# Debug "Row $Row"

			Pratham=1
			for ((current_column=1; current_column<=number_of_columns; current_column++))
			do
				# Get Nth Column Value and Iterate for Other Symbols
				for Column in "`echo ${Row} |cut -d, -f$current_column`"
				do
					# See If Column is Attached with Link
					# Links are Useful While Parsing it for Web/HTML
					link=`echo $Column | grep '#link'| wc -w`
					
					if [[ $link -gt 0 ]]
					then
						# Below Commands, Combinely Ignores #link Attached to Sub-Topic	

						# Replace #link by Comma
						Column=${Column//'#link'/','}
						# Get Content Befor Comma
						Column=`echo $Column | cut -d, -f1`
					fi

					# As We are Parsing CSV, Comma will be Treated as Separator.
					# If we want Comma, In Content, We can use )^( instead
					Column=${Column//')^('/','}

					# As Entire Content for Single Sub-Topic is in Same Line,
					# We Can Use Semicolon to have New Line in Generated Content
					Column=${Column//';'/'\n\t'}

					#Column=`echo $Column| sed -e 's/^[\s]*//'`
					
					if [[ $Pratham -eq 1 ]]
					then
						#echo -ne $'\E[1;37m' $Column $'\E[0m' "\n\t"

						# If it is First Value of Row i. e. Topic
						# Display in Different Colour i. e. Blue
						title "$Column"
						echo -ne "\n\t"
						Pratham=2
					else
						# Use Other Color for Non-First Value of a Row
						echo -ne $'\E[1;33m' $Column $'\E[0m' "\n\t"
					fi
				done
			done
		fi
		echo
done < $1 ;
