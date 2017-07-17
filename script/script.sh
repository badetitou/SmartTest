#!/usr/bin/env bash
set -xv

export VM=vm
export PROJECT_NAME='CORA'

# load and install the latest VM
wget --quiet -O - get.pharo.org/$PHARO+$VM | bash

## =========================================================================
./pharo Pharo.image save $PROJECT_NAME --delete-old
./pharo $PROJECT_NAME.image --version > version.txt
## =========================================================================

./pharo $PROJECT_NAME.image eval --save "
  Metacello new  
    baseline: #CORA;
    githubUser: 'badetitou' project: 'CORA' commitish: '$VERSION' path: '.';
    onWarningLog;
    load".

./pharo $PROJECT_NAME.image eval --save "
	CORATestCoverageTestFinderStrategy prepareInJenkinsForPackagesNamed: #('CORA')
  ".
  
 ./pharo $PROJECT_NAME.image test --junit-xml-output "(CORA).*"

#==create local settings=====================================================
zip -r $PROJECT_NAME.zip $PROJECT_NAME.image $PROJECT_NAME.changes

# clean up the workspace to not occupy too much stale space on the slaves
rm -rf *.image *.changes
rm -rf pharo-vm
rm -rf Pharo.app
rm -rf PharoV{10,20,30,40,50}.sources
