#!/bin/sh
# --batch to prevent interactive command
# --yes to assume "yes" for questions

gpg --quiet --batch --yes --decrypt --passphrase="$ANDROID_KEYS_ZIP_PASSPHRASE" \
--output android/key_files.zip android/key_files.zip.gpg && cd android && jar xvf key_files.zip && cd -

mv ./android/key_files/flutterCICDkeystore.jks ./android
mv ./android/key_files/key.properties ./android
mv ./android/key_files/service_account_key.json ./android

ls -d $PWD/android/*
# move your file according to path in key.properties
