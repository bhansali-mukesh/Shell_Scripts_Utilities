
### Author : BHANSALI MUKESH KUMAR

### http://shukriya-janaab.blogspot.com/
### https://github.com/bhansali-mukesh/

This Package Provides Shell Utilities for Many Purpose.
We tried to Make them Generic and Moduler.
Here are few of them

1. Environment Related Utilities ( Non Empty Environment Variable etc. )
2. Object Utilities ( Map, Ordered Map etc. )
3. File Utilities ( Creating Map From Properties Files etc. )
4. User Input ( Waits for user Inputs )
5. Kubernetes Helper 
	a. Find Right Context from Multiple Kubernetes Objects for your Resource
	b. Get Resource Details from Kubernetes and Responds to you
	c. Parses Your Resources into Multiple Part and Provide Meaning
	d. Update Your Context with Needed Details like Authentication etc.
6. Create/Refresh Authentication as and when Needed Automatically
7. Intercept Command for Pre-Processing and Fire with Added things
8. Format, UnFormat, Color and re-Direct Text Based on Requirement
9. Provide Automatic or one Word Access to All Major functionality
10. Dynamic Documentation, Parses Comment and Generate Documentation

Map, Ordeed Map, Property Reader, Kubernetes Informer, text Formatter, Substitutor etc with Example


Bhansaliam : 
#### Open Myself

Bhansali_Document : 
# Utility Function which Parses this File and Generates The Bhansali Documents to Help,
# The Command "Bhansali" Generating Help Document from the Source on Runtime

Bhansali : 
# Just type "Bhansali" on Terminal
# If Bhansali is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add/Update Command(s) in this Utility with Proper Comment, it will Automatically Be Visible in Bhansali (Help) as well.
# Example
# 1. Bhansali
# 2. Bhansali Find

Kuberam : 
# Open Myself

Cloud : 
# Get Kubenetes Result from Pods
#	Example :
#			Cloud -c resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija -p CP
#			Cloud -f health
#			Cloud -c resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija -x "df -H"
# Paramters
#       1. -c Cluster Id ( Optional ),
#               If Not Passed, Just Shows Data Plane Commands and Exits
#               If Given, Defaults to CP
#       2. -p Pod Plane ( Optional ) Either CP or DP
#	3. -f Searches Command From Provided String Pattern, If Posible ( Case In-sensitive )
#	4. -x In Line Command	# Helpful While Scripting Further Where We DON'T Want Human Intervention
#
# It Helps on Commands on Showing Appropriate Command Lists
# 	a. You Can choose any Number from Given List
#	b. You Can Provide Custom Commands as well
#	c. You Can Press ENTER
# It Enquires Relevant Pod for the Given Command & Shows you Relevant Results
# In Case, You Don't Provide Anything and Just Press Enter, It will take you to Pod Terminal

cli : 
# Set Alias "cli" to Point to Cloud_Command_Interceptor.sh instead of Directly Executing Command
# Example
#		cli refresh session
# Kind of Command Interceptor
# It Extract Country & Location From Given Command
# Adds them in Command Line and Execute
# Update Kubernetes Configuration Files to Update, If Needed

Auth : 
# Authenticate the Cloud Session
# Example
#		Auth
#
# Creates Cloud Session, If Needed
# Refreshes Session to Set Later Expiry, If Session is Already Valid
# ( Cloud Session is Valid for 2 Hours, If not Refershed )

Connect : 
# Get Kubenetes Result from Pods
# Example
# 		Connect ~/.kube/DEV_MUMBAI_CP resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija CP "ls -l; df -h; free -m"
#
# Paramters
# 	1. Kube Config File Path ( Mandatory ), Error Otherwise
#	2. Cluster Id ( Optional ), If Not Passed, Opens Terminal for CP Pod
#	3. Pod Plane ( CP or DP ) ( Optional )
#		If Not Given, If Cluster Id is Present, Set Pod Plane = DP, Otherwise CP
#		If Given Anything which Doesn't Conatin "DP" in Any Case ( Say, XYZ etc ), Default to CP
#	4. Command List ( Optional )
#		Can be Given List of Commands but in Double Quotes ("") Separate them By Semicolon

Collector : 
# Get Cluster Data
# Example
#		export ES_ADMIN_PASSWORD=guHW2fI6cVdrAbQAz9zrwMFgvASqLUMxFHa4ADe395K6Wrhoreiok50XkBSMXP9z2 ( If Authentication is Needed )
#		Collector resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija
#
# Parameters
#	1. Cluster ID ( Mandatory )
#		The Cluster, For which We want to get Details

Find : 
# Find Kubernetes Configuration File for Given Cluster ID
# Example
#	Find resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija DP
#
# Paramters
# 	1. Cluster Id ( Mandatory ), Error Otherwise
#	2. Pod Plane ( CP or DP ) ( Optional )
#		Defaul to DP
#		If Given Anything which Doesn't Conatin "CP" in Any Case ( Say, XYZ etc ), Default to DP

Commandor : 
# List Available Commands to Choose from
# Example
#               Commandor -c resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija -r ~/Productivity_Scripts/Resources/Example.properties -p CP -s Deleting
#               Commandor -f index
#
# Paramters
#       1. -c Cluster Id ( Optional )
#               Replaces Value of Variable ${CLUSTER_ID} in Selected Command
#               If Not Passed, Lists Data Plane Commands to Choose From, Otherwise control Plane
#       2. -f String Pattern ( Optional )
#               Searches Property File with Key Pattern Matching Provided Pattern, Case In Sensitive
#       3. -r Resource Property File Path ( Optional )
#               Shows Commands to choose from that file instead of Default
#       4. -p Pod_Plane ( CP or DP ) ( Optional )
#               If Cluster Id is NOT Given, Set to DP
#               If Cluster Id is Given, Set to CP
#       5. -s State ( Optional )
#               State of the Cluster
#               Replaces Value of Variable ${STATE} in Selected Command

Refresh : 
# Refreshes Cloud Session, If Session is Valid

Refresher : 
# Refreshes Cloud Session Continuously, If Session is Valid

Kube_Update : 
# Add Profile and Auth Parameters in KubeConfig File Under $HOME/.kube Directory
# Example
#		Kube_Update user5
#
# Paramters
#	1. User ( Optional )
#		If Not Given, Defaults to user1

kubectl : 
# Authenticate Before Firing kubectl Commands
# Intercepts kubectl Command
# Create A Cloud Session, If Not Created
# Refreshes Cloud Session, If Session is Already Created

Kuber : 
# Just type "Kuber" on Terminal
# If Kuber is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update Command(s) in this Utility with Proper Comment, it will Automatically Be Visible in Kuber as well.
# Example
# 1. Kuber
# 2. Kuber Find

Kuber_Document : 
# Utility Function which Parses this File and Generates The Kuber Documents to Help,
# The Command "Kuber" Generating Help Document from the Source on Runtime

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
#                       ./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv 'OS=`echo $line | cut -d"," -f2`; echo $OS'
#			./Dharta.sh ../Data/Example_Input_IP_OS_Version.csv "`cat ../Data/Example_Processing_for_IP_OS_Version.sh`"
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
#		"echo" will be Considered as Output of Script/Command and Stored in Output File.
#		Please don't use echo for other Purposes like Debugging etc.
#		OR Use "echo >&2 instead"

Sevak : 
# Just type "Sevak" on Terminal
# If Sevak is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Be Visible in Sevak as well.
# Example
# 1. Sevak
# 2. Sevak Dharta

Sevak_Document : 
# Utility Function which Parses this File and Generates The Sevak Documents to Help,
# The Command "Sevak" Generating Help Document from the Source on Runtime
