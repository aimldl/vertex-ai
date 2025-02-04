#!/bin/bash
#  jb_publish.sh
#    * Created: 2025-02-04 (Tue)
#    * Updated: 2025-02-04 (Tue)

DIR_SOURCE="_build/html"
FILE_TOKEN="../token"

## Function Definitions
run() {
  COMMAND=$1
  echo "${COMMAND}"
  eval "${COMMAND}"
}

# Commands
run "cat ${FILE_TOKEN}"
run "ghp-import -n -p -f ${DIR_SOURCE}"
