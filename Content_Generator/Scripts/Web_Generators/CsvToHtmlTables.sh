#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Generates Web/HTML Table from CSV Sources
# Parses CSV File and Generate Web Presentable Content Out of it
# Needs CSV Input File as Source

# If Line Starts with #, Just Enter a New Line and Continue
# It is Indication of a New Sub-Topic

# As We are Parsing CSV, Comma will be Treated as Separator.
# If we want Comma, In Generated Content, We can use )^( instead

# As Entire Content for Single Sub-Topic is in Same Line,
# We Can Use Semicolon to have New Line in Generated Content


START_TABLE='<table border="2" bordercolor="#1298A3">'
END_TABLE='</table>'

echo "$START_TABLE"

while read Row ;
do
	# If Line is Blank
	# Start a New Table
	if [[ $Row =~ ^$ ]]
	then
		echo "$END_TABLE </br> $START_TABLE"
	else
		# Start a Row in Table
		echo "<tr>";

		number_of_commas=`echo ${Row} | grep -o ',' | wc -l`

		# First Column is NOT Preceeded by Comma
		# So Total Number of Columns are Commas in the Row + 1
		number_of_columns=$(($number_of_commas + 1))
	
		# Debug Statment
		#echo Row $Row
		for ((current_column=1; current_column<=number_of_columns; current_column++))
		do
			# Parse current Column Values
			for Column in "`echo ${Row} |cut -d, -f$current_column`"
			do
				# If Column starts with #, Treat it as Table Header, Otherwise Normal Table Data Cells
				if [[ $Column =~ ^# ]];
				then
					open='<th>'
					close='</th>'
					Column=${Column//'#'/''}
				else
					open='<td>'
					close='</td>'
				fi

				link=`echo $Column | grep '#link'| wc -w`
				if [[ $link -gt 0 ]]
				then
					# If Link is Attached to Header
						# 1. Get the URL
						# 2. Create and HTML Anchor Element Out of it So User Can click it, If they Wish

					Column=${Column//'#link'/','}
					Column=`echo $Column | awk -F',' '{print "<a href="$2"> "$1" </a>" }'`
				fi

                                        # As Entire Content for Single Sub-Topic is in Same Line,
                                        # We Can Use Semicolon to have New Line in Generated Content

				# As We are Parsing CSV, Comma will be Treated as Separator.
                                # If we want Comma, In Content, We can use )^( instead
				Column=${Column//')^('/','}

				# As Entire Content for Single Sub-Topic is in Same Line,
                                # We Can Use Semicolon to have New Line in Generated Content
				Column=${Column//';'/'</br>'}

				# Print HTML Content
				echo "$open $Column $close"
			done
		done
	echo "</tr>"
	fi

done < $1 ;

echo $END_TABLE
