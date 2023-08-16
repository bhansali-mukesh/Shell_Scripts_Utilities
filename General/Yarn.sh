#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# Current Directory Path
# This Works only in ZSH
# Other Simple Simple Alternative is
# 	`dirname $0`
# But Above works only you call the script and Not When Some Other Script Calls it/it's function
Yarner=`dirname ${(%):-%N}`

# Open Myself
alias Yarn="vi ${Yarner}/Yarn.sh"

# yarn aliases

# Cleaning yarn cache
alias cache='yarn cache clean'

# Yarn Clean
alias clean='yarn clean'

# Yarn With Cleaning and Clearing Cache
alias YARN='cache; clean; yarn'

# Yarn Lint Fix
alias lint='yarn lint --fix'

# Yarn Build
alias build='yarn build'

# Yarn Start
alias start='yarn start'

# Yarn Fix Lint and  Build 
alias Build='yarn lint --fix && yarn build'

# Yarn Finx Lint, Build and Start
alias Start='Build; start'

# Yarn Test a File
alias Test_File='yarn test -u'

# Yarn Fix Lint and Test all
alias Test='lint && yarn test'

# Yarn Build Local Client
alias Local='yarn build-client-local'

# If it works, it means you have eslint installed in the project but not globally.
alias linter='npx eslint -v'

# Get All Yarn Command in Your Project
alias run='yarn run'
