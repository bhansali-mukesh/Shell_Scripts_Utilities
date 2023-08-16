
# Author : BHANSALI MUKESH KUMAR

# This Utility Script provides many useful aliases and help to work with git

# Step You May Follow for Usage 
	#1 Save this file on your Computer ( $HOME/Git.sh, You may save at other location but that will lead to some other changes, See custom and profile section for more )
	#2 You May Move Entire "Profile Section" to your profile file ( .zprofile or so ), See profile section for more
		# If You Don't Move "Profile Section" Then At Least You Need to Run This File to Use This Utitlity
	#3 Change Name and Workspace Directories/Repositories, See Custom Section for more
	#4 Type "Git" ( Optionally with Regular Expression ), It Will Show You Everything it Has
	#5 Type "Git Usage" for Git on Set up and Usage
	#6 You can also Add, Update aliases here, and If You Provides Proper Comments Above Your Commands, That Will Also Be Visible in Git
alias Usage='Git Usage';

# Another Name for Usage
alias Setup='Usage';

###### {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{ CUSTOM SECTION }{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{} ######

Gitter=${0}

# Open Git Utility
alias GIT="vi ${Gitter}"

# Git Directory
Git_Directory=`dirname ${Gitter}`

# Defines Workspace Directory 
export WORKSPACE="~/Repositories/Abhyuday"

# Goes to WorkSpace Directory
alias Workspace="cd $WORKSPACE"

# PLEASE CHANGE BELOW AS PER YOUR NEED

# Used for checking My Git Log, You Need to Put You Name in Git Log
# Need to Change
export NAME="BHANSALI";

# Remote Name for Git Repository
export origin="origin"

# Git Master/Main Branch NAME
export master="master"


###### ------------------------------------------ HELP SECTION ------------------------------------------ ######

# Just type "Git" on Terminal
# If Git is Followed By Some Special Command then it will Show Git for that Command
# Else Displaying Git with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Visible in Git as well. 
	# Example
		# 1. Git
		# 2. Git Commit
alias Git='function JASOL() { Document=`Git_Document`; if [ M"$1" = "M" ]; then echo "$Document"| less; return; fi;  echo ""; echo "$Document" | sed -n "/^"$1"/,/^$/p"; }; JASOL'


# Utility Function which Parses this Git File and Generates The Git Documents to Git, The Command "Git"
# Generating Git Document from the Source on Runtime
alias Git_Document='function MB() { Comment_Character="#"; Alias_Character="alias"; Git=""; Alias=""; for SCRIPT in `ls ${Git_Directory}/*sh`; do; while read line; do if [[ $line == $Comment_Character* ]]; then Git="$Git""\n""$line"; else Alias_Found=`echo "$line"| grep $Alias_Character`; if [[ M"$Alias_Found" != "M" ]]; then Alias=`echo "$line"| cut -d"=" -f1 | tr -s " "| cut -d" " -f2`; if [[ M"$Alias" != "M" ]]; then echo -e "\n$Alias" : "$Git"; Git=""; fi; else Git=""; fi; fi; done < "$SCRIPT"; done; }; MB'


###### ***************************************** GIT ALIASES ***************************************** ######

								# Repository and Branches

# Set up Repositories
# No Parameter
# Example git clone ssh://ssg-vayam.kvm.com:29418/rpeo
alias CLONE='function KUMAR() { Workspace; remotes=`git remote show`; for remote in $remotes; do echo "Cloning $remote ..."; remote_url=`git remote show $remote | grep -im1 URL | rev | cut -d" " -f1| rev`; git clone $remote_url; Update_Remote; done; }; KUMAR'

# Gets Updates in Remote Repositories ( Example : New Branch (repo.fox-cps05 ) is added in remote repository which is now know to local )
# it checkout -b FOX_CPS05 --track origin/repo.fox-cps05
alias Update_Remote='git remote update; git fetch';

# Goes to Workspace
# Creates and checks out the same git branch and Track Master/Main Branch
# You can switch to your branch any time by just typing it's Jira id
# Example 
#        Branch Name : NGCONT-1745_Infiniti-Create-new-homepage-outlines
#        Just Fire Command : Create NGCONT-1745_Infiniti-Create-new-homepage-outlines
# Now if I type "1745" on terminal Anytime, I am switched to this Branch
# Need Parameter
# alias Create='function MBMB(){ Workspace; `Validator 1 "Need a Parameters ( Branch Name )" $@`; story=`echo $1| cut -d'_' -f1`; echo "alias $story=\"From=`Current`; git checkout $1 \"" >> ${Gitter}; git checkout -b $1 --track $origin/$master; echo -e "\t\tType " \"$story\" " to Jump to this Branch, Anytime"; source $Gitter; };MBMB'

# Creates a New Branch and Checks out the Same
# You can switch to your branch any time by just typing it's Jira id
# Need a Parameter
# Example
#        Branch Name : NGCONT-1745_Infiniti-Create-new-homepage-outlines
#        Just Fire Command : New NGCONT-1745_Infiniti-Create-new-homepage-outlines
# Now if I type "1745" on terminal Anytime, I am switched to this Branch
alias New='function MBMB(){ `Validator 1 "Need a Parameters ( Branch Name )" $@`; story=`echo $1| cut -d'_' -f1`; echo "alias $story=\"From=`Current`;git checkout $1 \"" >> $Gitter; Master; Fetch; git checkout -b $1 $origin/$master; echo -e "\t\tType " \"$story\" " to Jump to this Branch, Anytime"; source $Gitter; };MBMB'

# Checkout a Branch from a Tag/Build
alias Tag='function MBMB(){ `Validator 2 "Need 2 Parameters ( Branch Name, Tag Name )" $@`; story=`echo $1| cut -d'_' -f1`; echo "alias $story=\"From=`Current`;git checkout $1 \"" >> $FILENAME; Master; Fetch; git checkout -b $1 $2; echo -e "\t\tType " \"$story\" " to Jump to this Branch, Anytime"; source $FILENAME; };MBMB'

# Checkout a File From a Tag/Build
# Example :
alias Tagged='function MBMB(){ `Validator 2 "Need 2 Parameters ( Tag Name, File Name )" $@`; git checkout tags/$1 $2; };MBMB'

# Downloads a Remote Branch into Local and Checks out the Same
# You can switch to your branch any time by just typing it's Jira id
# Need a Parameter
# Example
#        Branch Name : Update_User_Message_Branch
#        Just Fire Command : Remote Update_User_Message_Branch
alias Remote='function MBMB(){ `Validator 1 "Need 1 Parameter ( Remote Branch Name )" $@`; story=`echo $1| cut -d'_' -f1`; echo "alias $story=\"From=`Current`; git checkout $1 \"" >> $FILENAME; Master; Fetch; git checkout -b $1 origin/"$1"; echo git checkout -b $1 origin/"$1"; echo -e "\t\tType " \"$story\" " to Jump to this Branch, Anytime"; source $FILENAME; };MBMB'

# Git Repository Browser
# No Parameter Needed
alias Browse='gitk'

# Shows All Branches in Repository
# No Parameter
alias Bbranch="git branch";

# Another Short Hand For briefing git Branches
alias B=Bbranch;

# Briefs for all current local git branches
# No Parameter
alias Branch='git branch -vv';

# Rename a Branch
# Need 2 Parameters (1. SourceName  2. NewName )
# Example
	# Rename OLD_NAME NEW_NAME
alias Rename='function MARWAR() { `Validator 2 "Need 2 Parameters (1. SourceName  2. NewName )" $@`; git branch -fm $1 $2; }; MARWAR'

# Show All Branches ( including remote )
# No Parameter
alias All='git branch -a'

# Shows current git branch
# No Parameter
alias Current='Branch| grep \* | cut -d" " -f2;'

# Goes to PREVIOUS git branch
# No Parameter
alias Previous='Present=$From; Checkout $Present';

# Checkout to a git branch
# Also Useful For Reverting Local Changes for a Particular File
# Need Parameter
# Example
	# 1.	Checkout Master
	# 2.	Checkout REAME.html
alias Checkout='From=`Current`; git checkout'

# Changes Branch Forcefully
alias CHECKOUT='Checkout -f'

# Goes to Master/Main Branch
# No Parameter
alias Master='Checkout $master';

# Pulls origin Master/Main ( Merge Latest From Master Branch )
# No Parameter
alias Origin='git pull $origin $master';

# Git Cherry Pick
# Need a Parameter, Commit Id
# Example
#	 Pick cedc47d72fc
alias Pick='git cherry-pick'


								# Changes Workflow
								
										## Review Changes
										
# Gives List of All Local Changes ( Whether it is not in Remote Repository )
# No Parameter
alias S="git status"

# Gives List of All Modified Files only ( File Should be in Remote Repository )
# No Parameter
alias M='function Changes() { git status | grep -E "deleted|modified|new file|renamed"; git ls-files . --exclude-standard --others; }; Changes';

# Show Difference for Particular File
# Need Parameter
# Example
	# Diff README.html
alias Diff="git diff"


										## Temporary Changes ( Not in any Branch )
										
# Saves Change Point to Rollback in Future
# No Parameter
alias Sstash='git stash';

# Saves Change Point with Name to Rollback in Future, If Needed ( Needs a Parameter, Checkpoint Name )
# No Parameter
alias Stash='BranchName=`Current`; git stash push -u -m $BranchName'

# Stash Changes including untracked file ( -u )
# Untracked files are the Files which are not in remote repositories ( Newly Added Files ) etc.
# Undo local changes
# No Parameter
alias Save='BranchName=`Current`; git stash push -m $BranchName --patch';

# List all the Stashes
# No Parameter
alias List="git stash list"

# Goes to Latest Saved Change Point
# No Parameter
alias Pop='Sstash pop';

# Apply a Stash Number
# Need Parameter
# Example
	# Apply 0
alias Apply='function BHANSALI() { git stash apply stash@{$1}; }; BHANSALI'

# Remove a Stash From Stash List
# Need Parameter
# Example
	# Drop 0
alias Drop='function BHANSALI() { git stash drop stash@{$1}; }; BHANSALI'

# Remove multiple Stash From Stash List With Given Word
# Need Parameter
# Example
	# Drop_For ES-1298
alias Drop_For='function BHASM() { `Validator 1 "Need a Parameters ( Search String )" $@`; dropped_stashes=0; for stash_index in `git stash list | grep "${1}" | cut -d: -f1 | cut -d{ -f2 | cut -d} -f1`; do echo; echo Found at index $stash_index; drop_index=$(($stash_index-$dropped_stashes)); dropped_stashes=$(($dropped_stashes+1)); echo Dropping...; git stash drop stash@{$drop_index}; done; echo; echo -e "\t\t DONE"; }; BHASM'

# Move Branch to a Specific Commit
# Need a Parameter ( Commit HASH CODE which can be taken from 'git log' command )
# Example
# 	Move_To 1eb53a5e185331c0285ff8d2a2dc8dff661bfa87
alias Move_To='git reset --hard'

# Reference : https://www.git-tower.com/learn/git/commands/git-restore#:~:text=The%20%22restore%22%20command%20helps%20to,added%20to%20the%20Staging%20Area.
# Restore/UnAdd File(s)
alias Restore='git restore'

# DANGEROUS COMMAND
# Clears All Stash Entries 
# Need No Parameter
alias SCLEAR='git stash clear

'
										## Revert Changes
										
# Clean UnTracked Files and Directories
# No Parameter
alias Clean='git clean -fdx';

# Un Stage Changes ( Changes will remain but it will be removed from added files )
# Optional Parameter
#
# 	If Parameter is Given, Will Unstage only those Changes
#		Example :
#			reset README.md
#
# 	Else Un Stage All Change
#		Example :
#			reset
alias reset='git reset'

# Un Stage an un-committed File and Undo Changes from that file
# Need Parameter(s)
# Example
	# Reset Git.sh
alias Reset='function MUKESH() { `Validator 1 "Need a Parameters ( File Name )" $@`; reset $1; Checkout $1; }; MUKESH'

# DANGEROUS COMMAND
# Un Stage all un-committed Files and Undo Changes
# No Parameter
alias RESET='reset; Checkout .'

# DANGEROUS COMMAND : You May Lose Your Changes
# Revert Code to Origin Master/Main
# No Parameter
alias HARD_RESET='Fetch; git reset --hard $origin/$master; Clean; Pull'

# Rebase to Origin Master Branch
# No Parameter
# alias Rebase='git rebase $origin $master;'

# Merge Current Branch with Latest Master in Local
# No Parameter
alias Remaster='Master; git pull origin $master; Previous; BranchName=`Current`; git pull origin $BranchName; git merge $master;'

# Abort Rebase Operation
# No Parameter
alias RContinue='git rebase --continue'

# Abort Rebase Operation
# No Parameter
alias RAbort='git rebase --abort'


										## Get Changes From Remote Repository
										
# Link Missing Jars
# No Parameter
alias Phat='git phat init; git phat link; git pull'

# Links and then Pulls the Branch
alias PULL="Phat"

# Fetches Remote Branch into your Local But DO NOT Merge Changes into Your Local Branch.
# No Parameter
alias fetch='git fetch';

# Before fetching, remove any remote-tracking references that no longer exist on the remote ( Recommended )
# No Parameter
alias Fetch='git fetch --prune'

# Merges Changes into Branch
# Need Parameter
alias Merge='git merge';

# Opens Git UI for Resolving Conflicts
alias Resolve='git mergetool'

# Keep Mine Changes for Resolving Conflicts in Rebase/Merge/Pull/Stash Apply
# Warning : Keep Backup as Command Will Over Write File
# Need File Path as Parameter
#	Example
#		MINE Client.java	
alias MINE="git checkout --our"

# Keep Their Changes for Resolving Conflicts in Rebase/Merge/Pull/Stash Apply
# Warning : Keep Backup as Command Will Over Write File
# Need File Path as Parameter
#	Example
#		YOUR Client.java	
alias YOUR="git checkout --their"

# Select Change Portions Interactively for Resolving Conflicts in Rebase/Merge/Pull/Stash Apply
# Warning : Keep Backup as Command Will Over Write File
# Need File Path as Parameter
#       Example
#               Conflict Client.java
# alias Conflict='git checkout --patch'

# Fetches Remote Branch into your Local and Merges Changes into Your Local Branch ( Fetch + Merge ) .
# No Parameter
alias Ppull='git pull';

# Goes to Workspace, Pulls from Remote, Comes Back 
# No Parameter
alias Pull='No_Changes=`Stash|grep -i "No local changes"| wc -l`; Ppull; if [ $No_Changes -eq 0 ]; then Pop; fi';

# Prune Remote Branches to resolve Errors while Pull etc.
alias Prune='it gc --prune=now'

											## Add Local Changes ( To Local Branch, Nothing to Remote Yet )
											
# Opens Git GUI
# No Parameter
alias Gitui="git gui"

# Adds files to Commit
# Need Parameter(s)
# Example
	# Add README.html
alias Add='git add';

# Adds jar files to Commit by git phat
# Need one Parameter
# 	Example
# 		ADD tools_vs/lib/SystemGeneration.jar
alias ADD='function SULTAN() { `Validator 1 "Need 1 Parameter ( 1. Jar File Full Path Name )" $@`; git phat add "$1"; git phat push "$1"; }; SULTAN'

# Un Adds files From Staging
# Need Parameter(s)
# Example
	# UnAdd README.html
alias UnAdd='git restore --staged';

# Commits Added File in Branch for Permanent Changes
# Need Message Parameter
# Example
	# Ccommit "Changes to Improve Performance"
alias Ccommit='git commit -m';

# It Needs "Commit Message" in double quotes as Parameter.
# Also Saves a Copy as Stash as Local Backup or Rollback Point as a Separate Commit ( When you Amend this Commit Later, Commit is overwritten but Stash is NOT )
# Add, Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
# Need Confirmation and Commit Message
# Example
	# Commit "Issue Resolved"
alias Commit='function MKBJ(){ `Validator 1 "Need a Parameters ( Commit Message )" $@`; changes=`M|wc -l`; if [ "$changes" -eq 0 ]; then echo -e "\n\t No New Changes Found.\n"; return; fi; echo -e "\n\t$changes file(s) identified.\n"; M; `Confirmer`; Stash; Apply 0; Add .; Ccommit "$1"; Push; };MKBJ'

# Create An Empty Commit
alias empty='git commit --allow-empty -m'

# It Needs "Commit Message" in double quotes as Parameter.
# Also Saves a Copy as Stash as Local Backup or Rollback Point as a Separate Commit ( When you Amend this Commit Later, Commit is overwritten but Stash is NOT )
# Add, Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
# Need Confirmation and Commit Message
# Example
        # Empty "Merge Resolve"
alias Empty='function MKBJ(){ echo -e "\n\t$changes file(s) identified.\n"; M; `Confirmer`; Stash; Apply 0; Add .; empty "$1"; Push; };MKBJ'

# Amends Last Commit in Branch for Permanent Changes
# Need Message Parameter
# Example
	# Aamend "Amending Changes to Improve Performance"
alias Aamend='git commit --amend -m'

# Amends Last Commit in Branch for Permanent Changes
# No Parameter
alias amend='git commit --amend'

# No Parameter Required
# Save Copy as Stash For Recovery as Separate Commit/Rollback Point ( Because it is an Amend, It has previous Commit Changes as well but Stash has Exclusive Changes for this Amend )
# Add, Amend Last Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
# Need Confirmation
# Example
         # Amend
alias Amend='function VIMLESH(){ changes=`M|wc -l`; if [ "$changes" -eq 0 ]; then echo -e "\n\t No New Changes Found\n"; return; fi; echo -e "\n\t$changes file(s) identified.\n"; M; `Confirmer`; Stash; Apply 0; Add .; amend; PUSH; };VIMLESH'

# Remove Commits From History, However Changes Stays in Work Directory
# Need an Optional Parameters ( Number of Commits )
# Consider 1 Commit, If Parameter is not Passed
# Example
	# UnCommit
	# UnCommit 3
alias UnCommit='function ADI() { if [ J"$1" != "J" ]; then Numer_Of_Commits=$1; else Numer_Of_Commits=1; fi; git reset --soft HEAD~$Numer_Of_Commits; echo "Un Committed $Numer_Of_Commits Commits"; }; ADI'

# Combine Multiple Commits
# Need 2 Parameters ( 1. Number of Commits, 2. Commit Message )
# Example
	# Combine 4 "Combining 4 Commits into one Single Commit"
alias Combine='function JODHPUR() { `Validator 2 "Need 2 Parameters ( 1. Number of Commits, 2. Commit Message )" $@`; git reset --soft HEAD~$1; git commit -m "$2"; }; JODHPUR'


											## Push Changes to Remote

# Drafts Git Commits to Remote
alias Draft='git draft;'

# Publish Git Commits to Remote
alias Publish='function B() { echo -e "\n\t Do You Want Publish Now ( Recommended to \"Combine ( All Commits )\" First, Ignore if Already Combined ) ?\n"; `Confirmer`; git publish; }; B'

# Push Changes to Remote
# No Parameter Needed
alias push='git push'

# Push Current Branch to Remote
# No Parameter
alias Push='me=`Current`; git push --set-upstream origin $me'

# FORCEFULLY Push Current Branch to Remote Without Verification
# No Parameter
alias PUSH='git push --no-verify -f'

											## Debug Problems
# git bisect - Use binary search to find the commit that introduced a bug
# This is Just Introduction and not Complete
# See Below Reference to use the same
# Reference : https://www.metaltoad.com/blog/beginners-guide-git-bisect-process-elimination
#	Example : 
#		git bisect start;
#		git bisect good <COMMIT_HASH>
#		git bisect bad <COMMIT_HASH>
alias Bisect='git bisect start'

# git bisect - Use binary search to find the commit that introduced a bug
# This is Just Introduction and not Complete
# See Below Reference to use the same
# Reference : https://www.metaltoad.com/blog/beginners-guide-git-bisect-process-elimination
#       Example :
#               git bisect run <bugtest.sh>
alias Debug='function JODHPUR() { `Validator 1 "Need 1 Parameters ( 1. Bug Test Script )" $@`; git bisect run $1; }; JODHPUR'

# Refernce : https://www.vinta.com.br/blog/2015/3-awesome-git-commands/
# git blame is a command command to find commit who changed sources for each line of any file
# Also we can find the previous author before any commit
# Example :
#		git blame ocibuild.conf ( Show Author of each lin ein file named ocibuild.conf )
#		   We can see entire commit show in 1st column of output via
#		git show <COMMIT_HASH>>
alias Blame='function JASOL() { `Validator 1 "Need 1 Parameters ( 1. File Name )" $@`; git blame $1; }; JASOL'

# Reference : https://www.vinta.com.br/blog/2015/3-awesome-git-commands/
# With git blame we can also we can find the previous author before any commit
#	Example
#               git blame ocibuild.conf <COMMIT_HASH>~1 ( Show Changes beofre this commit )
alias Before='function ADI() { `Validator 2 "Need 2 Parameters ( 1. File Name, 2. Commit Id )" $@`; git blame $1 $2; }; ADI'

# Can this Search in Older Versions of Project ?
# TO DO
alias Grep='git grep'


											## Delete Un Used Branches
										
# Remove git branch
# Need Parameter
# Example
	# Remove OLD_BRANCH
alias Remove="git branch -D";

# Deletes the branch you are currently on
# Need Confirmation
alias Delete='Me=`Current`; echo -e "\n\t Do You Want to Delete Branch \"$Me\" \n"; `Confirmer`; Master; Remove $Me;'

# Delete All Local git branches except Master
# No Parameter
alias Delete_But='Master; git branch | tr -s " "| cut -d" " -f2 | grep -v $master | xargs git branch -d;'

								
										# Log Views
										
# Git Log
# No Parameter
alias Log='git log --graph --decorate --pretty=oneline --abbrev-commit';

# Shows git logs related to YOU only ( Filtered Logs )
# No Parameter
alias My='git log --author $NAME; Back'

# git Logs for specific Author
# Need Parameter
# Example
	# Author MUKESH
alias Author='git log --author';

# git logs since $date
# Need Date Parameter
# 	Example
#		1.	Since "Thu May 18 14:51:20 IST 2022"
#		2.	Since Yesterday
alias Since='git log --since';

# git Logs for TODAY's changes
# No Parameter
alias Today='git log --after="yesterday"';

# git Logs for Changes Since YESTERDAY
# No Parameter
alias Yesterday='git log --since=yesterday.midnight';



										# ADVANCE Section

# Creates a New Commit which is Opposite of Given Commit Id to Nullyfy It's Effect
# Reverts Given (Id) Commit
# Needs a Parameter ( Commit Id ) to Revert 
alias REVERT='git revert';

# Creates a New Commit which will nullify the effect of Last Commit
# No Parameter
alias UNDO='Last_Commit=`git log | head -n 1 | cut -d" " -f2`; git revert $Last_Commit';

# DANGEROUS COMMAND : One Should Not Use it on Public/Remote Repositories
# Rollback Commits, You May Lose Changes done in Last Specified Number of Commits which you Specifies
# It is What is Expected from this Command to Rollback Some Commits.
# You Need to Specify, How Many Commits Needs to be Rolled Back as Parameter
# Need Parameter ( Go How Many Commits Needs to be Rolled Back )
# Example
	# ROLLBACK 2
alias ROLLBACK='function OK() { `Validator 1 "Need a Parameters ( Number of Commits )" $@`; head=""; commits=$1; commit=0; while [ $commit -lt $commits ]; do head="$head"^; commit=`expr $commit + 1`; done; git reset --hard HEAD$head ; }; OK'


# DANGEROUS COMMAND : One Should Not Use it Untill He/She is confident about Usage
# Rewrite Commit History, To Undo Commit, Edit Message and More
# Need Parameter ( Go How Many Commits Behind, To Rewrite History )
# Example
	# Rewrite 5
alias REWRITE='function OK() { `Validator 1 "Need a Parameters ( Number of Commits )" $@`; head=""; commits=$1; commit=0; while [ $commit -lt $commits ]; do head="$head"^; commit=`expr $commit + 1`; done; git rebase -i HEAD$head ; }; OK'


# In case if you change your password and git doesn't know it
# Erase git cached Password ( Press Enter Twice )
# No Parameter
alias Git_Erase_Password='git credential-osxkeychain erase';

# Show Git Configuration
alias Config='git config --list'

# Shows List of Changed Files Between 2 Builds
# Need 2 Parameters ( 1. Source Build Number, 2. Changed Build Number )
# Example
        # ChnageList git log --pretty="format:" --name-only REPO.IGUANA.00.00.190...REPO.IGUANA.00.00.198
# alias ChangeList='function RAJASTHAN() { `Validator 2 "Need 2 Parameters ( 1. Source Build Number, 2. Changed Build Number )" $@`; git log --pretty="format:" --name-only REPO.IGUANA.00.00."$1"...REPO.IGUANA.00.00."$2"; }; RAJASTHAN'
	
	# Your Local Git Branch's Auto Generated Aliases Goes Here Automatically
# Below are the Aliases to Jump from one Branch to Another
alias July="From=master;git checkout July_Image "
