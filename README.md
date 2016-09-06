
This is a basic general-purpose ReactNative/Android command line build script.

It is intended to be deployed to CodeShip for CI builds of a ReactNative app.

###### Things it does
Will install dependencies for and compile the Android version of your ReactNative app.

###### Things it doesn't
Does not run tests or create an apk. Could be edited to do that.

## How To Use

Setup a new CodeShip build.

Add `codeship-install-android.sh` to your repository at the root.

Edit the variables in `codeship-install-android.sh` to make sure you're using the right sdk/tools/api versions for your app.

Paste the contents of `codeship-build.sh` into the test setup step in CodeShip. Your setup should now look something like this:

```bash
jdk_switcher use oraclejdk8

source ./codeship-install-android.sh

nvm use || nvm install
npm install --ignore-scripts
npm run link

cd android
touch local.properties
echo "sdk.dir=$ANDROID_HOME" >> local.properties
./gradlew assembleDebug
```

## Credit
Thanks to [Jonathan Muller](https://gist.github.com/PuKoren) and [Bogdan Gradinariu](https://github.com/gion) for the gruntwork.
