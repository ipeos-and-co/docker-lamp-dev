#!/bin/bash

VERSION=$1
IMAGE=lamp-dev
TARGET=ipeos/$IMAGE:$VERSION

if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version>"
  exit 1
fi

if [ $VERSION = "latest" ]; then
  docker build -t $TARGET php7
  exit 1;
fi

if [ $VERSION = "php7" ]; then
  docker build -t $TARGET php7
  exit 1;
fi

if [ $VERSION = "php5" ]; then
  docker build -t $TARGET php5
  exit 1;
fi

echo "Specify a correct version: latest | php7 | php5"
exit 1
