#!/bin/bash

OS=`uname -s | tr '[:upper:]' '[:lower:]'`
TAG=`git describe --tags $CIRCLE_SHA1`

# Download GitHub releases script
curl -L -O https://github.com/aktau/github-release/releases/download/v0.6.2/$OS-amd64-github-release.tar.bz2
tar -xjf $OS-amd64-github-release.tar.bz2
GITHUB_RELEASE=./bin/$OS/amd64/github-release

# Create GitHub release
$GITHUB_RELEASE release -u stereobooster -r tree-sitter.js --tag $TAG

$GITHUB_RELEASE upload -u stereobooster -r tree-sitter.js --tag $TAG --name tree-sitter.js --file lib/tree-sitter.js
$GITHUB_RELEASE upload -u stereobooster -r tree-sitter.js --tag $TAG --name tree-sitter.js.mem --file lib/tree-sitter.js.mem

# Use the CI host's NPM_TOKEN environment variable for auth
echo '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' >.npmrc

# Unfortunately NPM doesn't respect .npmignore or use correct GPY files when
# calculating gypfile.
# Let's delete all the related files as a workaround.
# https://github.com/npm/read-package-json/pull/52
rm -fr **.gyp{,i}

# Publish to npm
npm publish
