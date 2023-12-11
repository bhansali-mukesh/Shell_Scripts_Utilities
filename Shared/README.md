
# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

Sevakam : 
# Open Myself

Dharta : 
# Script Takes an Input File and a Command(s)/Script to Process 1 Line of it.
# It will Process First Record for Example and Does the Time Calculation and Wait for User to Confirm Proceeding
# It will Process all Lines in Input Files with Logic Provided as Second Parameter ( Commands/Script )
# It will Display the Output on Standard Input as well as Store it in a File
# It will Also Convert Multi-Line Output into Comma Separated Single Line Output to Store in CSV ( Excel Like ) File for Better Visualization as well as Program Input
# It will Add Prefix Output With Line Number, So that We can Relate Input to Output
# You can find Examples in ../Data/ Directory
# The Output File Name Can be Seen on Console Output ( Usually Latest in ../Data/Dharta*.csv )
#
#       Example :
#                       ./Dharta.sh ../Data/Clusters_With_Image.csv 'cluster_id=`echo $line | cut -d" " -f2`; result=`$KUBER/Scripts/Karta.sh -c $cluster_id -x ls -o true`; echo $result'
#			./Dharta.sh ../Data/Clusters_With_Old_Image.csv "`cat ../Data/Example.sh`"
#
# Paramters
#       1. File Path
#		Input File Path ( Mandatory )
#		This Script will Process Each Line of That
#
#	2. Command(s)
#		Single Command or List of Commands ( Preferred In Single Quotes ), Separated By Semicolon
#		Which Needs to be Executed on Pod
#		We can also Write these Commands in Script and cat that as Parameters
#		As Shown in Example
#
#	Note :
#		Please Note that, We have to use $line as a Place Holder for Each Line
#		The Script will Replace it will Actual Values from Input File in Runtime and Process
#
# 	Note :
#		echo will be Considered as Output of Script/Command and Stored in Output File.
#		Please don't use echo for other Purposes like Debugging etc.
#		OR Use echo >&2 instead

# As Above Dharta Works Just for 1 Input File,
# Sanskaran, Calls Dharta Multiple Times for Each Input Files in a Directory
#
#       Example :
#                       ./Sarv_Dharta.sh ~/Inputs/ ../Data/Example.sh
#
# Paramters
#       1. Input Directory
#               Input Directory Path ( Mandatory )
#               This Script will Pass Each File to Dharta.sh for Further Processing of Input Files from Given Directory, Excluding Directories in it, Processing Just Files
#       2. Shell Script
#               A Shell Script to Process Each Line of Input Files
#

Sevak : 
# Just type "Sevak" on Terminal
# If Sevak is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Be Visible in Sevak as well.
# Example
# 1. Sevak
# 2. Sevak Dharta
# 3. Sevak Sanskaran

Sevak_Document : 
# Utility Function which Parses this File and Generates The Sevak Documents to Help,
# The Command "Sevak" Generating Help Document from the Source on Runtime
