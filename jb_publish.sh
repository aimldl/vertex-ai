#!/bin/bash
#  jb_publish.sh
#    * Created: 2025-02-04 (Tue)
#    * Updated: 2025-02-05 (Wed)

DIR_SOURCE="_build/html"
FILE_TOKEN="../token"  # Consider a more secure way to handle tokens than `cat ../token`. 
# For example, use environment variables or a dedicated secrets management solution.

## Function Definitions
run() {
  COMMAND=$1
  echo "${COMMAND}"
  eval "${COMMAND}"
}

# Commands
run "cat ${FILE_TOKEN}"
run "ghp-import -n -p -f ${DIR_SOURCE}"
