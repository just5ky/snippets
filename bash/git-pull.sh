#!/bin/bash

# Let the person running the script know what's going on.
echo "\nPulling in latest changes for all repositories...\n"

# Find all git repositories and update it to the master latest revision
for i in $(find . -type d -name ".git" -maxdepth 2 -exec dirname {} \;); do
    echo "";
    echo $i;

    # We have to go to the .git parent directory to call the pull command
    pushd "$i";

    git checkout master;
    status=$?
    if [ $status -ne 0 ]; then
      break
    fi

    # finally pull
    git pull;
    status=$?
    if [ $status -ne 0 ]; then
      break
    fi
    git checkout -;

    # lets get back to the current dir
    popd
done

echo "Complete!"