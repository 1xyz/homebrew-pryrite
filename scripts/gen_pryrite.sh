#!/bin/bash

if [ -z "$RELEASE_VERSION" ]
then
      echo "\$RELEASE_VERSION is not set"
      exit 1
fi

echo "Download https://github.com/1xyz/pryrite/releases/download/$RELEASE_VERSION/pryrite-darwin-amd64-$RELEASE_VERSION.zip"
wget https://github.com/1xyz/pryrite/releases/download/$RELEASE_VERSION/pryrite-darwin-amd64-$RELEASE_VERSION.zip -P /tmp/

stat /tmp/pryrite-darwin-amd64-$RELEASE_VERSION.zip

export SHA256_CHECKSUM=$(sha256sum /tmp/pryrite-darwin-amd64-$RELEASE_VERSION.zip | cut -d ' ' -f 1)
echo "sha256sum $SHA256_CHECKSUM"

envsubst < tmpl/pryrite_rb.tmpl > formula/pryrite.rb

unset RELEASE_VERSION
unset SHA256_CHECKSUM
