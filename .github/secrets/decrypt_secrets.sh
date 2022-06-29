#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Flutter_Pipeline_Demo.mobileprovision.mobileprovision ./.github/secrets/Flutter_Pipeline_Demo.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Certificate.p12 ./.github/secrets/Certificate.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/Flutter_Pipeline_Demo.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Flutter_Pipeline_Demo.mobileprovision.mobileprovision


security create-keychain -p "password" build.keychain
security import ./.github/secrets/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "password" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
