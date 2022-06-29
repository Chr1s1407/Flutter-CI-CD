#!/bin/bash

set -eo pipefail

xcrun altool --upload-app -t ios -fbuild/ios/iphoneos\ app.ipa -u "$IOS_USERNAME" -p "$IOS_PASSWORD" --verbose
