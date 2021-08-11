#!/usr/bin/env bash
#
# Utility to generate a predefined type of password and copy it to the
# clipboard.  Uses the Bitwarden cli for password generation.

if [[ ! $(bw generate -uln --length 20 | pbcopy) ]]; then
  echo "Password copied to clipboard successfully!"       
  sleep 3                                                 
else                                                      
  echo "Problem generating or copying password."          
fi
