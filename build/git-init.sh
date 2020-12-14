#!/bin/bash -e

if [ "${DEST_PATH}" == "" ] ; then
  echo 'DEST_PATH must be specified to initialize project:'; echo ; echo 'DEST_PATH="~/workspace/quickstart-my-repo" make git-init'
  exit 1
fi

mkdir -p "${DEST_PATH}"
cp -r ./ "${DEST_PATH}"
cd "${DEST_PATH}"

rm -rf .git docs/boilerplate
git init
git submodule add https://github.com/aws-quickstart/quickstart-documentation-base-common.git docs/boilerplate
git submodule sync
git submodule update --init --recursive --remote
git add .

echo "sucessfullly initialised new repo in ${DEST_PATH}."
