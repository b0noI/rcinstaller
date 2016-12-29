#!/bin/bash

ZSH_RC=".zshrc"
BASH_RC=".bashrc"

COMMON_RC_FILE=".commonrc"
if [ $# -eq 1 ]
  then
  COMMON_RC_FILE=$1
fi

cp ./$COMMON_RC_FILE $HOME
function link_commonrc() {
  system_rc=$1
  system_rc_path=$HOME"/"$system_rc
  commonrc=$2
  echo "Searching for $system_rc_path"
  if [ -e "$system_rc_path" ]
  then
    echo "$system_rc file has been found, checking if it already includes $commonrc"
    if grep -Fxq "$system_rc_path" "$commonrc"
    then
     echo "looks like $commonrc need to be added. Adding."
     echo "source ~/$commonrc" >> ~/$system_rc_path
     echo "file $commonrc has been added to the $system_rc"
     echo "$commonrc has been added to the $system_rc"
    else
     echo "$system_rc already has the $commonrc"
    fi
  else
    echo "no $system_rc file has been found."
  fi
}

link_commonrc $ZSH_RC $COMMON_RC_FILE
link_commonrc $BASH_RC $COMMON_RC_FILE
