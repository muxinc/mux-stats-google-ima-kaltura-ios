# Mux-Stats-Google-IMA-Kaltura-iOS

This pod was created with `pod lib create`

## Development

To run the example project, clone the repo, and run `pod install` from the Example directory first. Then open
up the .workspace in the Example/ directory

## Tests

Run tests in XCode with cmd + u

## Installation

MUXSDKImaListener is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ux-Stats-Google-IMA-Kaltura-iOS'
```

## Releasing a new version

* Update Mux-Stats-Google-IMA-Kaltura.podspec
* cd Example/ and run `pod install` (this will install the updated version into the example app)
* commit your changes
* git tag vX.X.X (example: git tag v0.3.0)
* git push --tags
* attach the .zip folder to the Release in github
* pod trunk push Mux-Stats-Google-IMA-Kaltura.podspec --allow-warnings

## Author

Mux, ios-sdk@mux.com


