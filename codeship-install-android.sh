#!/bin/bash

ANDROID_SDK_VERSION=24.4.1
CURRENT_DIR=`pwd`
CACHE_DIR="$CURRENT_DIR/node_modules/codeship-cache/$ANDROID_SDK_VERSION"
ANDROID_HOME="$CACHE_DIR/android-sdk-linux"
PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

#####################################################
# ANDROID SDK
#####################################################
if [ ! -d "$ANDROID_HOME" ]; then
  #Relying on CodeShip caching of the node_modules directory
  mkdir -p $CACHE_DIR
  pushd $CACHE_DIR
    wget http://dl.google.com/android/android-sdk_r$ANDROID_SDK_VERSION-linux.tgz
    tar zxvf android-sdk_r$ANDROID_SDK_VERSION-linux.tgz
    rm android-sdk_r$ANDROID_SDK_VERSION-linux.tgz

    #While loop is for auto-accept licence terms (press y every 1 sec)

    #Build tools
    ( sleep 1 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --no-ui --all --filter tools,platform-tools,build-tools-24.0.2,build-tools-23.0.1

    #Install API24
    ( sleep 1 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --no-ui --all --filter android-24,sys-img-armeabi-v7a-android-24

    #CodePush needs API23
    ( sleep 1 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --no-ui --all --filter android-23,sys-img-armeabi-v7a-android-23

    #Extras
    ( sleep 1 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --no-ui --all --filter extra-android-m2repository
  popd
fi

export ANDROID_HOME
export PATH
