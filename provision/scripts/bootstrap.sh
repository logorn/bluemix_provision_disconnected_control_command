#!/usr/bin/env bash

#! /bin/bash

echo " "
echo " ----- INSTALLING/UPDATING CLOUDFOUNDRY ----- "
echo " "

set -ex

ibm_email=$1
ibm_pass=$2

cf -v

if [[ -z "$ibm_email" ]] || [[ -z "$ibm_pass" ]]
then
  echo ibm_email and ibm_pass need to be defined, use: >&2
  echo ibm_email=your@email ibm_pass=yourpass vagrant up >&2
  exit 1
fi

# ng for us/southwest, this is is eu-gb
cf login -a https://api.eu-gb.bluemix.net -u $ibm_email -p $ibm_pass
cf -v

echo " "
echo " ----- INSTALLING/UPDATING CLOUDFOUNDRY: DONE! ----- "
echo " "
