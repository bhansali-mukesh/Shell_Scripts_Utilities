#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Current Directory Path
# This Works only in ZSH
# Other Simple Simple Alternative is
# 	`dirname $0`
# But Above works only you call the script and Not When Some Other Script Calls it/it's function
export PROFILER=`dirname ${(%):-%N}`

# Open Custom Profiler
alias PROFILE="vi ${PROFILER}/PROFILE.sh"

# Enable Custom Aliases
. ${PROFILER}/Custom.sh

# Enable Maven Aliases
. ${PROFILER}/Maven.sh

# Enable Aliases to Native Commands
. ${PROFILER}/Native.sh

# Enable Aliases for yarn
. ${PROFILER}/Yarn.sh

# Just type "Profile" on Terminal
# If Profile is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add, Update and Command in this Utility with Proper Comment, it will Automatically Be Visible in Profile as well.
        # Example
                # 1. Profile
                # 2. Profile grep
alias Profile='function JASOL() { Document=`Profile_Document`; if [ M"$1" = "M" ]; then echo "$Document"| less; return; fi;  echo ""; echo "$Document" | sed -n "/^"$1"/,/^$/p"; }; JASOL'


# Utility Function which Parses this File and Generates The Kuber Documents to Help,
# The Command "Profile" Generating Help Document from the Source on Runtime
alias Profile_Document='function MB() { Comment_Character="#"; Alias_Character="alias"; Help=""; Alias=""; for SCRIPT in `ls $PROFILER/*sh`; do; while read line; do if [[ $line == $Comment_Character* ]]; then Help="$Help""\n""$line"; else Alias_Found=`echo "$line"| grep $Alias_Character`; if [[ M"$Alias_Found" != "M" ]]; then Alias=`echo "$line"| cut -d"=" -f1 | tr -s " "| cut -d" " -f2`; if [[ M"$Alias" != "M" ]]; then echo -e "\n$Alias" : "$Help"; Help=""; fi; else Help=""; fi; fi; done < "$SCRIPT"; done; }; MB'

