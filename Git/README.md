## Author : BHANSALI MUKESH KUMAR

This Utility Provides Many Useful One Work Shortcut for Complex Git Commands/Sequence of Commands, Function, Git + Shell, Customization, Flexibility and Auto Generated Documentation, Dynamic Help etc

#### Usage : 
 Step You May Follow for Usage
1 Save this file on your Computer ( $HOME/Git.sh, You may save at other location but that will lead to some other changes, See custom and profile section for more )
2 You May Move Entire "Profile Section" to your profile file ( .zprofile or so ), See profile section for more
 If You Don't Move "Profile Section" Then At Least You Need to Run This File to Use This Utitlity
3 Change Name and Workspace Directories/Repositories, See Custom Section for more
4 Type "Git" ( Optionally with Regular Expression ), It Will Show You Everything it Has
5 Type "Git Usage" for Git on Set up and Usage
6 You can also Add, Update aliases here, and If You Provides Proper Comments Above Your Commands, That Will Also Be Visible in Git

Setup : 
 Another Name for Usage

GIT : 
 Open Git Utility

Workspace : 
 Goes to WorkSpace Directory

Git : 
 Just type "Git" on Terminal
 If Git is Followed By Some Special Command then it will Show Git for that Command
 Else Displaying Git with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
 If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Visible in Git as well.
 Example
 1. Git
 2. Git Commit

Git_Document : 
 Utility Function which Parses this Git File and Generates The Git Documents to Git, The Command "Git"
 Generating Git Document from the Source on Runtime

CLONE : 
 Set up Repositories
 No Parameter
 Example git clone ssh://ssg-vayam.kvm.com:29418/rpeo

Update_Remote : 
 Gets Updates in Remote Repositories ( Example : New Branch (repo.fox-cps05 ) is added in remote repository which is now know to local )
 it checkout -b FOX_CPS05 --track origin/repo.fox-cps05

New : 
 Creates a New Branch and Checks out the Same
 You can switch to your branch any time by just typing it's Jira id
 Need a Parameter
 Example
        Branch Name : NGCONT-1745_Infiniti-Create-new-homepage-outlines
        Just Fire Command : New NGCONT-1745_Infiniti-Create-new-homepage-outlines
 Now if I type "1745" on terminal Anytime, I am switched to this Branch

Tag : 
 Checkout a Branch from a Tag/Build

Tagged : 
 Checkout a File From a Tag/Build
 Example :

Remote : 
 Downloads a Remote Branch into Local and Checks out the Same
 You can switch to your branch any time by just typing it's Jira id
 Need a Parameter
 Example
        Branch Name : Update_User_Message_Branch
        Just Fire Command : Remote Update_User_Message_Branch

Browse : 
 Git Repository Browser
 No Parameter Needed

Bbranch : 
 Shows All Branches in Repository
 No Parameter

B : 
 Another Short Hand For briefing git Branches

Branch : 
 Briefs for all current local git branches
 No Parameter

Rename : 
 Rename a Branch
 Need 2 Parameters (1. SourceName  2. NewName )
 Example
 Rename OLD_NAME NEW_NAME

All : 
 Show All Branches ( including remote )
 No Parameter

Current : 
 Shows current git branch
 No Parameter

Previous : 
 Goes to PREVIOUS git branch
 No Parameter

Checkout : 
 Checkout to a git branch
 Also Useful For Reverting Local Changes for a Particular File
 Need Parameter
 Example
 1.	Checkout Master
 2.	Checkout REAME.html

CHECKOUT : 
 Changes Branch Forcefully

Master : 
 Goes to Master/Main Branch
 No Parameter

Origin : 
 Pulls origin Master/Main ( Merge Latest From Master Branch )
 No Parameter

Pick : 
 Git Cherry Pick
 Need a Parameter, Commit Id
 Example
	 Pick cedc47d72fc

S : 
 Gives List of All Local Changes ( Whether it is not in Remote Repository )
 No Parameter

M : 
 Gives List of All Modified Files only ( File Should be in Remote Repository )
 No Parameter

Diff : 
 Show Difference for Particular File
 Need Parameter
 Example
 Diff README.html

Sstash : 
 Saves Change Point to Rollback in Future
 No Parameter

Stash : 
 Saves Change Point with Name to Rollback in Future, If Needed ( Needs a Parameter, Checkpoint Name )
 No Parameter

Save : 
 Stash Changes including untracked file ( -u )
 Untracked files are the Files which are not in remote repositories ( Newly Added Files ) etc.
 Undo local changes
 No Parameter

List : 
 List all the Stashes
 No Parameter

Pop : 
 Goes to Latest Saved Change Point
 No Parameter

Apply : 
 Apply a Stash Number
 Need Parameter
 Example
 Apply 0

Drop : 
 Remove a Stash From Stash List
 Need Parameter
 Example
 Drop 0

Drop_For : 
 Remove multiple Stash From Stash List With Given Word
 Need Parameter
 Example
 Drop_For ES-1298

Move_To : 
 Move Branch to a Specific Commit
 Need a Parameter ( Commit HASH CODE which can be taken from 'git log' command )
 Example
 	Move_To 1eb53a5e185331c0285ff8d2a2dc8dff661bfa87

Restore : 
 Reference : https://www.git-tower.com/learn/git/commands/git-restore#:~:text=The%20%22restore%22%20command%20helps%20to,added%20to%20the%20Staging%20Area.
 Restore/UnAdd File(s)

SCLEAR : 
 DANGEROUS COMMAND
 Clears All Stash Entries
 Need No Parameter

Clean : 
 Clean UnTracked Files and Directories
 No Parameter

reset : 
 Un Stage Changes ( Changes will remain but it will be removed from added files )
 Optional Parameter

 	If Parameter is Given, Will Unstage only those Changes
	Example :
			reset README.md

 	Else Un Stage All Change
		Example :
			reset

Reset : 
 Un Stage an un-committed File and Undo Changes from that file
 Need Parameter(s)
 Example
 Reset Git.sh

RESET : 
 DANGEROUS COMMAND
 Un Stage all un-committed Files and Undo Changes
 No Parameter

HARD_RESET : 
 DANGEROUS COMMAND : You May Lose Your Changes
 Revert Code to Origin Master/Main
 No Parameter

Remaster : 
 Merge Current Branch with Latest Master in Local
 No Parameter

RContinue : 
 Abort Rebase Operation
 No Parameter

RAbort : 
 Abort Rebase Operation
 No Parameter

Phat : 
 Link Missing Jars
 No Parameter

PULL : 
 Links and then Pulls the Branch

fetch : 
 Fetches Remote Branch into your Local But DO NOT Merge Changes into Your Local Branch.
 No Parameter

Fetch : 
 Before fetching, remove any remote-tracking references that no longer exist on the remote ( Recommended )
 No Parameter

Merge : 
 Merges Changes into Branch
  Need Parameter

Resolve : 
 Opens Git UI for Resolving Conflicts

MINE : 
 Keep Mine Changes for Resolving Conflicts in Rebase/Merge/Pull/Stash Apply
 Warning : Keep Backup as Command Will Over Write File
 Need File Path as Parameter
	Example
		MINE Client.java

YOUR : 
 Keep Their Changes for Resolving Conflicts in Rebase/Merge/Pull/Stash Apply
 Warning : Keep Backup as Command Will Over Write File
 Need File Path as Parameter
	Example
		YOUR Client.java

Ppull : 
 Fetches Remote Branch into your Local and Merges Changes into Your Local Branch ( Fetch + Merge ) .
 No Parameter

Pull : 
 Goes to Workspace, Pulls from Remote, Comes Back
 No Parameter

Prune : 
 Prune Remote Branches to resolve Errors while Pull etc.

Gitui : 
 Opens Git GUI
 No Parameter

Add : 
 Adds files to Commit
 Need Parameter(s)
 Example
 Add README.html

ADD : 
 Adds jar files to Commit by git phat
 Need one Parameter
 	Example
 		ADD tools_vs/lib/SystemGeneration.jar

UnAdd : 
 Un Adds files From Staging
 Need Parameter(s)
 Example
 UnAdd README.html

Ccommit : 
 Commits Added File in Branch for Permanent Changes
 Need Message Parameter
 Example
  Ccommit "Changes to Improve Performance"

Commit : 
 It Needs "Commit Message" in double quotes as Parameter.
 Also Saves a Copy as Stash as Local Backup or Rollback Point as a Separate Commit ( When you Amend this Commit Later, Commit is overwritten but Stash is NOT )
 Add, Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
 Need Confirmation and Commit Message
 Example
 Commit "Issue Resolved"

empty : 
 Create An Empty Commit

Empty : 
 It Needs "Commit Message" in double quotes as Parameter.
 Also Saves a Copy as Stash as Local Backup or Rollback Point as a Separate Commit ( When you Amend this Commit Later, Commit is overwritten but Stash is NOT )
 Add, Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
 Need Confirmation and Commit Message
 Example
 Empty "Merge Resolve"

Aamend : 
 Amends Last Commit in Branch for Permanent Changes
 Need Message Parameter
 Example
 Aamend "Amending Changes to Improve Performance"

amend : 
 Amends Last Commit in Branch for Permanent Changes
 No Parameter

Amend : 
 No Parameter Required
 Save Copy as Stash For Recovery as Separate Commit/Rollback Point ( Because it is an Amend, It has previous Commit Changes as well but Stash has Exclusive Changes for this Amend )
 Add, Amend Last Commit and Push in 1 Shot ( Makes Our Branch Available in Remote Server, Also Used in Recovery, Share and Review Changes )
 Need Confirmation
 Example
 Amend

UnCommit : 
 Remove Commits From History, However Changes Stays in Work Directory
 Need an Optional Parameters ( Number of Commits )
 Consider 1 Commit, If Parameter is not Passed
 Example
 UnCommit
 UnCommit 3

Combine : 
 Combine Multiple Commits
 Need 2 Parameters ( 1. Number of Commits, 2. Commit Message )
 Example
 Combine 4 "Combining 4 Commits into one Single Commit"

Draft : 
 Drafts Git Commits to Remote

Publish : 
 Publish Git Commits to Remote

push : 
 Push Changes to Remote
 No Parameter Needed

Push : 
 Push Current Branch to Remote
 No Parameter

PUSH : 
 FORCEFULLY Push Current Branch to Remote Without Verification
 No Parameter

Bisect : 
 Debug Problems
 git bisect - Use binary search to find the commit that introduced a bug
 This is Just Introduction and not Complete
 See Below Reference to use the same
 Reference : https://www.metaltoad.com/blog/beginners-guide-git-bisect-process-elimination
	Example :
		git bisect start;
		git bisect good <COMMIT_HASH>
		git bisect bad <COMMIT_HASH>

Debug : 
 git bisect - Use binary search to find the commit that introduced a bug
 This is Just Introduction and not Complete
 See Below Reference to use the same
 Reference : https://www.metaltoad.com/blog/beginners-guide-git-bisect-process-elimination
       Example :
               git bisect run <bugtest.sh>

Blame : 
 Refernce : https://www.vinta.com.br/blog/2015/3-awesome-git-commands/
 git blame is a command command to find commit who changed sources for each line of any file
 Also we can find the previous author before any commit
 Example :
		git blame ocibuild.conf ( Show Author of each lin ein file named ocibuild.conf )
		   We can see entire commit show in 1st column of output via
		git show <COMMIT_HASH>>

Before : 
 Reference : https://www.vinta.com.br/blog/2015/3-awesome-git-commands/
 With git blame we can also we can find the previous author before any commit
	Example
               git blame ocibuild.conf <COMMIT_HASH>~1 ( Show Changes beofre this commit )

Grep : 
 Can this Search in Older Versions of Project ?
 TO DO

Remove : 
 Remove git branch
 Need Parameter
 Example
 Remove OLD_BRANCH

Delete : 
 Deletes the branch you are currently on
 Need Confirmation

Delete_But : 
 Delete All Local git branches except Master
 No Parameter

Log : 
 Git Log
 No Parameter

My : 
 Shows git logs related to YOU only ( Filtered Logs )
 No Parameter

Author : 
 git Logs for specific Author
 Need Parameter
 Example
 Author MUKESH

Since : 
 git logs since $date
 Need Date Parameter
 	Example
		1.	Since "Thu May 18 14:51:20 IST 2022"
		2.	Since Yesterday

Today : 
 git Logs for TODAY's changes
 No Parameter

Yesterday : 
 git Logs for Changes Since YESTERDAY
 No Parameter

REVERT : 
 Creates a New Commit which is Opposite of Given Commit Id to Nullyfy It's Effect
 Reverts Given (Id) Commit
 Needs a Parameter ( Commit Id ) to Revert

UNDO : 
 Creates a New Commit which will nullify the effect of Last Commit
 No Parameter

ROLLBACK : 
 DANGEROUS COMMAND : One Should Not Use it on Public/Remote Repositories
 Rollback Commits, You May Lose Changes done in Last Specified Number of Commits which you Specifies
 It is What is Expected from this Command to Rollback Some Commits.
 You Need to Specify, How Many Commits Needs to be Rolled Back as Parameter
 Need Parameter ( Go How Many Commits Needs to be Rolled Back )
 Example
 ROLLBACK 2

REWRITE : 
 DANGEROUS COMMAND : One Should Not Use it Untill He/She is confident about Usage
 Rewrite Commit History, To Undo Commit, Edit Message and More
 Need Parameter ( Go How Many Commits Behind, To Rewrite History )
 Example
 Rewrite 5

Git_Erase_Password : 
 In case if you change your password and git doesn't know it
 Erase git cached Password ( Press Enter Twice )
 No Parameter

Config : 
 Show Git Configuration

July : 
 Your Local Git Branch's Auto Generated Aliases Goes Here Automatically
 Below are the Aliases to Jump from one Branch to Another
