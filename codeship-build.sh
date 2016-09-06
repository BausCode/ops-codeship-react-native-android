#!/bin/bash

source ./codeship-install-android.sh

#####################################################
# NODE
#####################################################

nvm use || nvm install
npm install --ignore-scripts
npm run link

#####################################################
# BUILD APP
#####################################################

pushd android

  touch local.properties
  echo "sdk.dir=$ANDROID_HOME" >> local.properties

  ./gradlew assembleDebug

popd
