#!/bin/sh -x
# Exit if any error is encountered:
set -o errexit
# git name-rev is fail
CURRENT=`git branch | grep '\*' | awk '{print $2}'`
git checkout master
git pull --rebase origin master
git checkout ${CURRENT}
git rebase master

