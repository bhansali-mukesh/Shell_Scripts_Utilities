#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

ME=${(%):-%N}
export KUBER=`dirname ${ME}`

# Open Myself
alias Kuberam="vi $KUBER/KUBER.sh"

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
alias Cloud='$KUBER/Scripts/Karta.sh'

# Set Alias "cli" to Point to Cloud_Command_Interceptor.sh instead of Directly Executing Command
# Example 
#		cli refresh session
# Kind of Command Interceptor
# It Extract Country & Location From Given Command
# Adds them in Command Line and Execute
# Update Kubernetes Configuration Files to Update, If Needed
alias cli=$KUBER/Scripts/Cloud_Command_Interceptor.sh

# Authenticate the Cloud Session
# Example
#               Auth
#
# Creates Cloud Session, If Needed
# Refreshes Session to Set Later Expiry, If Session is Already Valid
# ( Cloud Session is Valid for one Hour, If not Refershed )
alias Auth='. $KUBER/Library/Cloud/Session_Manager.h && Authenticate_Session ${1} ${2}'

# Terminates the Cloud Session
# Example
#               Un_Auth
# 
alias Un_Auth='. $KUBER/Library/Cloud/Session_Manager.h && Terminate_Session'

# Re-Authenticate the Cloud Session
#       1. Terminates the Existing Session
#       2. Authenticate Again
# Example
#               Re_Auth
#
# Re-Creates Cloud Session
alias Re_Auth='. $KUBER/Library/Cloud/Session_Manager.h && Restart_Session'

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
alias Connect='$KUBER/Scripts/Kube_Connector.sh'

# Get Cluster Data
# Example
#		export ES_ADMIN_PASSWORD=guHW2fI6cVdrAbQAz9zrwMFgvASqLUMxFHa4ADe395K6Wrhoreiok50XkBSMXP9z2 ( If Authentication is Needed )
#		Collector resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija 
#
# Parameters
#	1. Cluster ID ( Mandatory )
#		The Cluster, For which We want to get Details
alias Collector='$KUBER/Scripts/OpenSearch_Data_Collector.sh'

# Find Kubernetes Configuration File for Given Cluster ID
# Example
#	Find resource.opensearchcluster.apac.bharat.pune.amaaaaaawtpq47yady45methtrh2yzwonu5ngqgsg7f54zxija DP
#
# Paramters
# 	1. Cluster Id ( Mandatory ), Error Otherwise
#	2. Pod Plane ( CP or DP ) ( Optional )
#		Defaul to DP
#		If Given Anything which Doesn't Conatin "CP" in Any Case ( Say, XYZ etc ), Default to DP
alias Find='$KUBER/Scripts/KubeConfig_Finder.sh'

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
alias Commandor=$KUBER/Scripts/Commandor.sh

# Refreshes Cloud Session, If Session is Valid
alias Refresh='. $KUBER/Library/Cloud/Session_Manager.h; Refresh_Session'

# Refreshes Cloud Session Continuously, If Session is Valid
alias Refresher='. $KUBER/Library/Cloud/Session_Manager.h; Refresh_Regularly'

# Add Profile and Auth Parameters in KubeConfig File Under $HOME/.kube Directory
# Example
#		Kube_Update user5
# 
# Paramters
#	1. User ( Optional )
#		If Not Given, Defaults to user1
alias Kube_Update='$KUBER/Scripts/KubeConfig_Updater.sh'

# Authenticate Before Firing kubectl Commands
# Intercepts kubectl Command
# Create A Cloud Session, If Not Created
# Refreshes Cloud Session, If Session is Already Created
alias kubectl='$KUBER/Scripts/Cloud_Authenticator.sh; \kubectl'

# Just type "Kuber" on Terminal
# If Kuber is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update Command(s) in this Utility with Proper Comment, it will Automatically Be Visible in Kuber as well.
        # Example
                # 1. Kuber
                # 2. Kuber Find
alias Kuber='function JASOL() { Document=`Kuber_Document`; if [ M"$1" = "M" ]; then echo "$Document"| less; return; fi;  echo ""; echo "$Document" | sed -n "/^"$1"/,/^$/p"; }; JASOL'


# Utility Function which Parses this File and Generates The Kuber Documents to Help,
# The Command "Kuber" Generating Help Document from the Source on Runtime
alias Kuber_Document='function MB() { Comment_Character="#"; Alias_Character="alias"; Help=""; Alias=""; while read line; do if [[ $line == $Comment_Character* ]]; then Help="$Help""\n""$line"; else Alias_Found=`echo "$line"| grep $Alias_Character`; if [[ M"$Alias_Found" != "M" ]]; then Alias=`echo "$line"| cut -d"=" -f1 | tr -s " "| cut -d" " -f2`; if [[ M"$Alias" != "M" ]]; then echo -e "\n$Alias" : "$Help"; Help=""; fi; else Help=""; fi; fi; done < "$ME"; }; MB'
