#!/bin/bash
#  jb_publish.sh
#    * Created: 2025-02-04 (Tue)
#    * Updated: 2025-02-04 (Tue)

DIR_SOURCE="_build/html"

## Function Definitions
run() {
  COMMAND=$1
  echo "${COMMAND}"
  eval "${COMMAND}"
}

COMMAND="ghp-import -n -p -f ${DIR_SOURCE}"
run "${COMMAND}"
