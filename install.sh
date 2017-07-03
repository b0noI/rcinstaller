#!/bin/bash

ZSH_RC=".zshrc"
BASH_RC=".bashrc"
PROFILES_PATH="${HOME}/.profile.d"

LINK_TO_BASH_RC="for f in ${HOME}/.profile.d/*; do source $f; done"

COMMON_RC_FILE=".commonrc"
if [ $# -eq 1 ]
  then
  COMMON_RC_FILE=$1
fi

# Creates ${PROFILES_PATH} if it's not exsists already.
function creat_conf_dir_if_needed() {
  if [ ! -d "${PROFILES_PATH}" ]
  then
    mkdir "${PROFILES_PATH}"
  fi
}

# Adds linkt to the rc file, name of the rc file passed via the argument.
function add_link_to_rcfile() {
  system_rc=$1
  system_rc_path=$HOME"/"$system_rc
  echo "Searching for $system_rc_path"
  if [ -e "$system_rc_path" ]
  then
    echo "$system_rc_path file has been found, checking if it already includes needed link: $LINK_TO_BASH_RC."
    if grep -F "$LINK_TO_BASH_RC" "$system_rc_path"; then
     echo "$system_rc already has the needed link: $LINK_TO_BASH_RC"
    else
     echo "looks like the link need to be added. Adding."
     echo "${LINK_TO_BASH_RC}" >> $system_rc_path
     echo "The link has been added to the $system_rc"
    fi
  else
    echo "no $system_rc_path file has been found."
  fi
}

creat_conf_dir_if_needed
add_link_to_rcfile $ZSH_RC
add_link_to_rcfile $BASH_RC
cp $COMMON_RC_FILE $PROFILES_PATH
echo "New RC has been installed, log out/in needed in order apply new changes."
