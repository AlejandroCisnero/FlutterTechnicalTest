# Flutter Technical Test

This is a simple Flutter application for watch and search dogs.

## Installation

This isntallation assumes that you have installed and configured Flutter and Git in your computer.

Go to the directory of your choice, open a terminal and run the following command.

```bash
git clone https://github.com/AlejandroCisnero/FlutterTechnicalTest.git
```
Once the process is finished, go to the project folder with the following command:

```bash
cd FlutterTechnicalTest
```
Now you must import all the dependencies with the following command:

```bash
flutter pub get
```

You're all set, well done

Finally you have to create a build for your platform [Android or IOS].

For IOS use this command:

```bash
flutter build ipa 
```
You can find your IPA in FlutterTechnicalTest/build/ios/archive/

For Android use this command:

```bash
flutter build apk --split-per-abi
```
You can find your APK in FlutterTechnicalTest/build/app/outputs/apk/release/app-armeabi-v7a-release.apk

If you prefer to run the application on your phone via debugging, connect your phone, and run the following command:

```bash
flutter run -d all
```

Select your device and you are done.

## A small glance

![Flutter Technical Test Home Page Screenshot](https://github.com/AlejandroCisnero/FlutterTechnicalTest/blob/develop/FlutterTechnicalTestHomePage.jpeg)