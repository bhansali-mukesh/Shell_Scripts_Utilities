
# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh

# "$line" is a Place Holder for Every Input line
# It will be Replaced By Actually Value by Parent Script i. e. ../Scripts/Dharta.sh for each line in input file

# Get Operating System Name From Input Line
OS=`echo $line | cut -d"," -f2`

# Search For Case In-Sensitive Search for "Windows"
POSIX=`echo $OS | grep -iv Windows`

# If Non Windows Standard Machine
if [ ! -z "$POSIX" ]
then
	# Get IP Address
	IP=`echo $line | cut -d"," -f1`
	
	# Get Available Disk Usage
	AVAILABLE_DISK_USAGE=`ssh $IP 'df -H | tr -s ' ' | cut -d' ' -f4'`
	
	# echo is Considered As Return Value
	# For Debugging and Other Purposes, Please use "echo <Message> >&2" instead of echo
	# Shown in Output as well as Stored in Output File
	echo $IP,$AVAILABLE_DISK_USAGE
else
	echo NA ( Windows Machine )
fi
