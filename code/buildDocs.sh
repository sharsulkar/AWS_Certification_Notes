#!/bin/bash
set -x
################################################################################
# File:    buildDocs.sh
# Purpose: Script that runs flask_frozen to convert flask templates to static html files. This script is executed by:
#            .github/workflows/docs_pages_workflow.yml
################################################################################
 
###################
# INSTALL DEPENDS #
###################
 
apt-get update
apt-get -y install git python3 python3-pip python3-frozen-flask 
pip3 install Frozen-Flask
 
#####################
# DECLARE VARIABLES #
#####################
 
pwd
ls -lah
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)
 
##############
# BUILD DOCS #
##############
which python
#pip3 --version
./code/freeze.py
 

#######################
# Update GitHub Pages #
#######################
 
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

pwd 

#docroot=`mktemp -d`
#rsync -a "docs/build/html/" "${docroot}/"
#rsync -av "/__w/H1B_LCA_outcome_prediction/H1B_LCA_outcome_prediction/docs/build/html/" "${docroot}/"
 
pushd "${docroot}"
 
# don't bother maintaining history; just generate fresh
#git init
#git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
#git checkout -b gh-pages
 
# add .nojekyll to the root so that github won't 404 on content added to dirs
# that start with an underscore (_), such as our "_content" dir..
#touch .nojekyll
 
 
# copy the resulting html pages built from sphinx above to our new git repo
git add .
 
# commit all the new files
msg="Updating Docs for commit ${GITHUB_SHA} made on `date -d"@${SOURCE_DATE_EPOCH}" --iso-8601=seconds` from ${GITHUB_REF} by ${GITHUB_ACTOR}"
git commit -am "${msg}"
 
# overwrite the contents of the gh-pages branch on our github.com repo
git push origin main
 
popd # return to main repo sandbox root
 
# exit cleanly
exit 0