#!/bin/bash
set -euo pipefail

echo "▸ Use Xcode 14.2"

sudo xcode-select -switch /Applications/Xcode_14.2.app

echo "▸ Current Xcode: $(xcode-select --print-path)"

echo "▸ Using Xcode Version: $(xcodebuild -version | grep Xcode | cut -d " " -f2)"

echo "▸ Validating Podspec"

echo "▸ Cleaning Cocoapods Cache"

pod cache clean --all

echo "▸ Adding Private Pod Repo"

pod repo add andrewjl-mux-specs https://github.com/andrewjl-mux/Specs.git

echo "▸ Updating Local Pod Repos"

pod repo update

echo "▸ Linting Local Private Pod Repo"

pod repo lint /Users/runner/.cocoapods/repos/andrewjl-mux-specs

echo "▸ Validating Podspec"

pod lib lint --allow-warnings --verbose --sources=https://cdn.cocoapods.org/,https://github.com/andrewjl-mux/Specs.git

echo "▸ Back to Xcode 14.3.1"

sudo xcode-select -switch /Applications/Xcode_14.3.1.app
