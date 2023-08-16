#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Current Directory Path
# This Works only in ZSH
# Other Simple Simple Alternative is
#       `dirname $0`
# But Above works only you call the script and Not When Some Other Script Calls it/it's function
Nativer=`dirname ${${(%):-%N}}`

# Open Aliases File for Native Commands
alias Native="vi ${Nativer}/Native.sh"

		# zsh Special

# Equals to `sed -i` in bash shell
#
# Find and Replace in Files
# Example
#		sed -i -- s/india/Bharat/g Countries.txt
alias SED_i='sed -i --'

		# General

# Alias to `alias` command
alias a=alias

# Clear Screen
alias c=clear

# Grep with Visible Color
alias grep='grep --color'

# Use vim instead of vi
alias vi='vim'

# Going Back to the Previous Directory, Silently ( Useful in Scripting Where User Need Not to Know About Changing Directories )
alias Back='cd - > /dev/null'
