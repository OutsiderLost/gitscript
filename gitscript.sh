#!/bin/bash

varONE=$1
varTWO=$2

### AUTO CHANGE USERNAME & TOKEN VALUE ###
autochange="$(echo $(echo "$varONE" | sed '/-c/!d;/.*.-c/d')$(echo "$varTWO" | sed '/-c/!d;/.*.-c/d')$(echo "$varONE""$varTWO" | sed '/--change/!d') | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
if [ "$autochange" = "1" ]; then
  echo "Add your TOKEN:"
  echo " " # (echo igrored)
  read -p "" varname1
  echo " " # (echo igrored)
  [ -f gitscript* ] && sed -i "29s/HTOKEN=.*/HTOKEN='$varname1'/g" gitscript* || sed -i "29s/HTOKEN=.*/HTOKEN='$varname1'/g" /usr/bin/gitscript*
  echo "(no change username -> press: ctrl + c)" # (echo igrored)
  echo "Add your USERNAME:"
  echo " " # (echo igrored)
  read -p "" varname2
  echo " " # (echo igrored)
  [ -f gitscript* ] && sed -i "30s/USERNAME=.*/USERNAME='$varname2'/g" gitscript* || sed -i "29s/HTOKEN=.*/HTOKEN='$varname1'/g" /usr/bin/gitscript*
  sleep 1
  echo "change value -> TOKEN='$varname1'"
  echo "change value -> USERNAME='$varname2'"
exit
else
echo -n ""
fi

# add your username & token value ---
HTOKEN='ghp_HtTpSt0kEn'
USERNAME='MyUsername'

# 0 -> empty input | -h, --help, $lenght <-> $lenght
# 1 -> repo name
# 2 -> repo & user name

# input minimum text length ----
lenght=4

# value2c="$(echo "$varONE$varTWO" | sed '/^.\{8\}/!d;/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
value1a2="$(echo -e "$(echo "$varONE" | sed "/^.\{$lenght,\}$/d")\n$(echo "$varTWO" | sed "/^.\{$lenght,\}$/d")" | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
value0="$(echo -e "$varONE\n""$varTWO" | sed -e '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
value1b="$(echo $(echo "$varONE" | sed '/-h/!d;/.*.-h/d')$(echo "$varTWO" | sed '/-h/!d;/.*.-h/d')$(echo "$varONE""$varTWO" | sed '/--help/!d') | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
# value1b="$(echo $(echo "$varONE" | sed '/-h/!d;/.*.-h/d')$(echo "$varONE" | sed '/--help/!d') | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
# value1c="$(echo $(echo "$varTWO" | sed '/-h/!d;/.*.-h/d')$(echo "$varTWO" | sed '/--help/!d') | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
if [ "$value1a2" = "1" ] || [ "$value1a2" = "2" ] || [ "$value0" = "0" ] || [ "$value1b" = "1" ]; then
  echo "use examples:"
  echo " "
  echo './gitscript.sh repoexample.git'
  echo './gitscript.sh USERNAME repoexample.git'
  echo './gitscript.sh https://github.com/USERNAME/repoexample.git'
  echo " "
  echo './gitscript.sh --change # or -c'
  exit
else
  echo "1. value input -> $varONE"
fi

### USERNAME & REPONAME INPUT CHECK ###
value2="$(echo -e "$varONE\n""$varTWO" | sed '/^[[:space:]]*$/d;s/[ ]//g' | wc -l)"
if [ "$value2" = "2" ]; then
  echo "2. value input -> $varTWO"
  USERNAME="$varONE"
  REPONAME="$varTWO"
  git clone 'https://'$HTOKEN'@github.com/'$USERNAME'/'$REPONAME || echo "(something error, or TOKEN not found, use: -c or --change) !!!"
else
### ONE VALUE CHECK ###
value3="$(echo "$varONE" | sed '/https:\/\/github\.com\//!d' | wc -l)"
if [ "$value3" = "1" ]; then
  echo "(value is link -> https...)"
  ### IN ALL COPIED LINK ###
  GITLINK="$(echo "$varONE" | sed 's/https:\/\///g')"
  git clone 'https://'$HTOKEN'@'$GITLINK || echo "(something error, or TOKEN not found, use: -c or --change) !!!"
else
  #### SIMPLE REPO INPUT ###
  echo "(simple repo input...)"
  REPONAME="$varONE"
  git clone 'https://'$HTOKEN'@github.com/'$USERNAME'/'$REPONAME || echo "(something error, or USERNAME or TOKEN not found, use: -c or --change) !!!"
fi
  echo "(one value input process end)"
fi
  echo "(all process end)"
