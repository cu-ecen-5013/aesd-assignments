#!/bin/sh

A3_URL=$1

if [ $# -lt 1 ]
	then
		echo "Missing A3 URL"
                echo "Usage: [./merge-script-assignment3.sh] [your_A3_Github_SSH_URL]"
                exit 1
	else
                echo "A3 URL USED"
fi

git remote remove origin

git remote add origin ${A3_URL}

git fetch assignments-base

git merge -X theirs assignments-base/assignment3

git checkout theirs assignments-base/assignment3

git submodule update --init --recursive

git push origin master
