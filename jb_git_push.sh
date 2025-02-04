#!/bin/bash
#  jb_git_push.sh
#    * Created: 2025-02-04 (Tue)
#    * Updated: 2025-02-04 (Tue)

FILE_TOKEN="../token"

## Function Definitions
run() {
  COMMAND=$1
  echo "${COMMAND}"
  eval "${COMMAND}"
}

# Commands
run "cat ${FILE_TOKEN}"
run "git add ./\*"
run "git commit -m 'Update the content'"
run "git push"
