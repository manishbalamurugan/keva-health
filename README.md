# Keva Health

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Installing Flutter SDK

For MacOS: https://flutter.dev/docs/get-started/install/macos

Run flutter doctor -v 
to see if there are any issues with your flutter installation. Check to see if everything that is expected to be installed is installed. Should provide feedback based on the issue. Following fixes for potential issues: 

XCode Installation: 

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer


Deploying to iOS Devices

Install Cocoapods -> sudo gem install cocoapods
To install dependencies run -> pod install 

Follow the Xcode signing flow to provision your project:

Open the default Xcode workspace in your project by running open ios/Runner.xcworkspace in a terminal window from your Flutter project directory.
Select the device you intend to deploy to in the device drop-down menu next to the run button.
Select the Runner project in the left navigation panel.
In the Runner target settings page, make sure your Development Team is selected. The UI varies depending on your version of Xcode.
For Xcode 10, look under General > Signing > Team.
For Xcode 11 and newer, look under Signing & Capabilities > Team.
When you select a team, Xcode creates and downloads a Development Certificate, registers your device with your account, and creates and downloads a provisioning profile (if needed).

