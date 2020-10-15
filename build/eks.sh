#!/bin/bash -xe

pyenv shell eks-quickstart-dev || { echo 'Have you run "make dev" to setup your dev environment ?' ; exit 1 ; }

# find account stack
ACC_STACK=false
for r in $(aws ec2 describe-regions --region ${AWS_REGION} --profile ${AWS_PROFILE} --output text --query Regions[].RegionName); do
  for s in $()
done