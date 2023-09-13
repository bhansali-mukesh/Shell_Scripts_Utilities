#!/bin/zsh

# Author : BHANSALI MUKESH KUMAR

# http://shukriya-janaab.blogspot.com/
# https://github.com/bhansali-mukesh/

Generator=${(%):-%N}
export GENERATOR=`dirname ${Generator}`

# Open Myself
alias Generatoram="vi $GENERATOR/GENERATOR.sh"

# Geenrates Console Presentable Contents From CSV Sources
alias Gen_Console='$GENERATOR/Scripts/Consolers/Consoler.sh'

# Geenrates Web/HTML Presentable Contents From CSV Sources
alias Gen_Web='$GENERATOR/Scripts/Web_Generators/HTMLGenerator.sh'
