
# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

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

Kuberam : 
# Open Myself

Cloud : 
# Get Kubenetes Result from Pods
#	Example :
#			Cloud -c id.opensearchcluster.oc1.iad.amaaaaaawtpq47yadjphtgbx6dhy45mg5mjkk2yzwonu5ngqgsg7f54zxija -p MP
#			Cloud -f health
# Paramters
#       1. -c Cluster Id ( Optional ),
#               If Not Passed, Just Shows Data Plane Commands and Exits
#               If Given, Defaults to MP
#       2. -p Pod Plane ( Optional ) Either MP or DP
#	3. -f Searches Command From Provided String Pattern, If Posible ( Case In-sensitive )
#	4. -x In Line Command
#
# It Helps on Commands on Showing Appropriate Command Lists
# 	a. You Can choose any Number from Given List
#	b. You Can Provide Custom Commands as well
#	c. You Can Press ENTER
# It Enquires Relevant Pod for the Given Command & Shows you Relevant Results
# In Case, You Don't Provide Anything and Just Press Enter, It will take you to Pod Terminal

Auth : 
# Authenticate the Cloud Session
# Example
#		Auth
#
# Creates Cloud Session, If Needed
# Refreshes Session to Set Later Expiry, If Session is Already Valid
# ( Cloud Session is Valid for one Hour, If not Refershed )

Connect : 
# Get Kubenetes Result from Pods
# Example
# 		Connect ~/.kube/DEV_MUMBAI_DP id.opensearchcluster.oc1.ap-mumbai-1.amaaaaaayzvoveqalnyullf4e3zj7wo4ewqhtv5i6jzuheczyeuyrxurjsaq DP "ls -l; df -h; free -m"
#
# Paramters
# 	1. Kube Config File Path ( Mandatory ), Error Otherwise
#	2. Cluster Id ( Optional ), If Not Passed, Opens Terminal for MP Pod
#	3. Pod Plane ( MP or DP ) ( Optional )
#		If Not Given, If Cluster Id is Present, Set Pod Plane = DP, Otherwise MP
#		If Given Anything which Doesn't Conatin "DP" in Any Case ( Say, XYZ etc ), Default to MP
#	4. Command List ( Optional )
#		Can be Given List of Commands but in Double Quotes ("") Separate them By Semicolon

Collector : 
# Get Cluster Data
# Example
#		export ES_ADMIN_PASSWORD=guHW2fI6cVdrAbQAz9zrwMFgvASqLUMxFHa4ADe395K6Wrhoreiok50XkBSMXP9z2 ( If Authentication is Needed )
#		Collector id.opensearchcluster.oc1.phx.amaaaaaahngrfpyaelhcoujdnntg7ldmx2p7cs4bve6yxejkzkgasrjwr6ia
#
# Parameters
#	1. Cluster ID ( Mandatory )
#		The Cluster, For which We want to get Details

Find : 
# Find Kubernetes Configuration File for Given Cluster CloudD
# Example
#	Find id.opensearchcluster.oc1.ap-mumbai-1.amaaaaaayzvoveqalnyullf4e3zj7wo4ewqhtv5i6jzuheczyeuyrxurjsaq DP
#
# Paramters
# 	1. Cluster Id ( Mandatory ), Error Otherwise
#	2. Pod Plane ( MP or DP ) ( Optional )
#		Defaul to DP
#		If Given Anything which Doesn't Conatin "MP" in Any Case ( Say, XYZ etc ), Default to DP

Commandor : 
# List Available Commands to Choose from
# Example
#               Commandor -c id.opensearchcluster.oc1.eu-frankfurt-1.amaaaaaaejac4waaj2grsrt7jcodbmssobwvw2afqldtisn6mso7eodclfda -r ~/Productivity_Scripts/Resources/Example.properties -p MP -s Deleting
#               Commandor -f index
#
# Paramters
#       1. -c Cluster Id ( Optional )
#               Replaces Value of Variable ${CLUSTER_ID} in Selected Command
#               If Not Passed, Lists Data Plane Commands to Choose From, Otherwise management Plane
#       2. -f String Pattern ( Optional )
#               Searches Property File with Key Pattern Matching Provided Pattern, Case In Sensitive
#        3. -r Resource Property File Path ( Optional )
#               Shows Commands to choose from that file instead of Default
#       4. -p Pod_Plane ( MP or DP ) ( Optional )
#               If Cluster Id is NOT Given, Set to DP
#               If Cluster Id is Given, Set to MP
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
#		Kube_Update oc5
#
# Paramters
#	1. Realm ( Optional )
#		If Not Given, Defaults to oc1

kubectl : 
# Authenticate Before Firing kubectl Commands
# Intercepts kubectl Command
# Create A Cloud Session, If Not Created
# Refreshes Cloud Session, If Session is Already Created

Kuber : 
# Just type "Kuber" on Terminal
# If Kuber is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Be Visible in Kuber as well.
# Example
# 1. Kuber
# 2. Kuber Find

Kuber_Document : 
# Utility Function which Parses this File and Generates The Kuber Documents to Help,
# The Command "Kuber" Generating Help Document from the Source on Runtime
