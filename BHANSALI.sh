#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

Kumar=${(%):-%N}
export BHANSALI=`dirname ${Kumar}`

# Open Myself
alias BHANSALIam="vi $BHANSALI/BHANSALI.sh"

# Enable Content Generator Tool
. $BHANSALI/Content_Generator/GENERATOR.sh

# Enable General Aliases
. $BHANSALI/General/PROFILE.sh

# Enable Git Aliases
. $BHANSALI/Git/Scripts/GIT.sh

# Enable Shared Utilities
. $BHANSALI/Shared/SEVAK.sh

# Enable Kubernetes Productivity
. $BHANSALI/Kubernetes/KUBER.sh

# Utility Function which Parses this File and Generates The BHANSALI Documents to Help,
# The Command "BHANSALI" Generating Help Document from the Source on Runtime
alias BHANSALI_Document='function MB() { Comment_Character="#"; Alias_Character="alias"; Help=""; Alias=""; while read line; do if [[ $line == $Comment_Character* ]]; then Help="$Help""\n""$line"; else Alias_Found=`echo "$line"| grep $Alias_Character`; if [[ M"$Alias_Found" != "M" ]]; then Alias=`echo "$line"| cut -d"=" -f1 | tr -s " "| cut -d" " -f2`; if [[ M"$Alias" != "M" ]]; then echo -e "\n$Alias" : "$Help"; Help=""; fi; else Help=""; fi; fi; done < "$Kumar"; }; MB'


# Just type "BHANSALI" on Terminal
# If BHANSALI is Followed By Some Special Command then it will Show Help for that Command
# Else Displaying Help with Pagination ( Press Enter or Space to Scroll, "q" to Quite )
# If you Add/Update Command(s) in this Utility with Proper Comment, it will Automatically Be Visible in BHANSALI (Help) as well.
        # Example
                # 1. BHANSALI
                # 2. BHANSALI Find
alias BHANSALI='function JASOL() { Document=`BHANSALI_Document; Kuber_Document; Sevak_Document`; if [ M"$1" = "M" ]; then echo "$Document"| less; return; fi;  echo ""; echo "$Document" | sed -n "/^"$1"/,/^$/p"; }; JASOL'
