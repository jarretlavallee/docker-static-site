#!/bin/bash
#### start.sh
## Basic init script to clone a git repo into `/var/www` and start nginx

## ENV Variables
# GIT_URL: The http path to the repo
# GIT_BRANCH: The branch name

echo "Evaluating git clone"
echo "URL: ${GIT_URL}"
echo "BRANCH: ${GIT_BRANCH}"
if [ ! -d "/var/www/.git" ]; then
 if [ -n "$GIT_URL" ]; then
   if [ -n "$GIT_BRANCH" ]; then
    echo "Checking out ${GIT_BRANCH} of ${GIT_URL}"
    git clone -b $GIT_BRANCH $GIT_URL /var/www
   else
    echo "Checking out ${GIT_URL}"
    git clone $GIT_URL /var/www
   fi
   chown -Rf root:root /var/www
   chmod -R a+r /var/www
 fi
else
  echo "Updating local repo from remote source"
  git --git-dir=/var/www/.git pull
fi

exec nginx -g "daemon off;"
