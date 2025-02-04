#!/bin/bash
#  jb_clean_build.sh
#    * Created: 2025-02-04 (Tue)
#    * Updated: 2025-02-04 (Tue)

DIR_SOURCE="_build/html"
FILE_TOKEN="../token"
WEB_BROWSER="google-chrome"  # firefox or google-chrome

## Function Definitions
run() {
  COMMAND=$1
  echo "${COMMAND}"
  eval "${COMMAND}"
}

# Function to launch a web browser based on the WEB_BROWSER variable.
launch_web_browser() {
  # Check if the variable WEB_BROWSER is set. If not, display usage and exit.
  if [ -z "$WEB_BROWSER" ]; then
    echo "Error: Variable WEB_BROWSER must be set." >&2
    echo "Usage: launch_web_browser <firefox|google-chrome>" >&2
    return 1 # Return an error code from the function.
  fi

  # Check the value of WEB_BROWSER and execute the corresponding command.
  if [ "$WEB_BROWSER" == "firefox" ]; then
    run "firefox ${DIR_SOURCE}/index.html"  # Launches Firefox
  elif [ "$WEB_BROWSER" == "google-chrome" ]; then
    # To install google-chrome, run:
    #   $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    #   $ sudo dpkg -i google-chrome-stable_current_amd64.deb
    #   $ sudo apt install -f
    #   $ sudo dpkg -i google-chrome-stable_current_amd64.deb
    run "google-chrome ${DIR_SOURCE}/index.html"  # Launches Google Chrome
  else
    # Use stderr for errors.
    echo "Error: Invalid browser specified in WEB_BROWSER." >&2
    echo "Valid browsers are 'firefox' and 'google-chrome'." >&2
    return 1  # Return an error code from the function.
  fi

  return 0 # Return a success code from the function.
}

# Commands
run "jb clean . --all"
run "jb build ."
launch_web_browser
