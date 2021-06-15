#!/usr/bin/env bash

echo -e "============================================================================================"
tmux ls | column -t
echo -e "============================================================================================\n"
SESSIONS=($(tmux ls | awk -F: '{print $1}'))
typeset -l REPLY

PS3="
Select a session to attach to or 'n' to create a new one: "

# this is to handle:
# 1. tmux server not started
# 2. tmux server started but has no sessions
if [[ ${#SESSIONS[@]} -eq 0 ]]; then
  echo "No sessions exist so creating a new one."
  REPLY='n'
  # only starts if server isn't started, does nothing if it is already running.
  # exits 0 either way.
  tmux start
else
  select SESSION in $(echo ${SESSIONS[@]}); do
    [[ $REPLY == @(0|q|quit|x|exit) ]] && exit 0 || break
  done
fi
  
# echo "Selected session: $SESSION"

if [[ $REPLY == n ]]; then
  echo "Creating new session."
  echo -n "Enter name for new session: "
  read NEWSESSION
  echo -e "\[\ek${NEWSESSION}\e\\]"
  # new session with 4 windows.  1st one is created by the new-sesion command
  tmux new-session -s $NEWSESSION\; new-window\; new-window\; new-window
else
  echo -e "\[\ek${SESSION}\e\\]"
  tmux attach-session -t "${SESSION}"
fi
