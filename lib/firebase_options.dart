// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBg8m4J7putOeida-J7t9c913-nSuk6qqU',
    appId: '1:1096841170679:web:b9c92d0acb05484e080df2',
    messagingSenderId: '1096841170679',
    projectId: 'thera-bot-606dd',
    authDomain: 'thera-bot-606dd.firebaseapp.com',
    databaseURL: 'https://thera-bot-606dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thera-bot-606dd.appspot.com',
    measurementId: 'G-B20SJGZEF8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARdpfpyeQIkOMwrSnOSoi-_ne4myNdro0',
    appId: '1:1096841170679:android:d7aca36135c980b6080df2',
    messagingSenderId: '1096841170679',
    projectId: 'thera-bot-606dd',
    databaseURL: 'https://thera-bot-606dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thera-bot-606dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABI_HlXfcmVlvluD_FSmz41z2u6ilFz7o',
    appId: '1:1096841170679:ios:ac744a4750928bbc080df2',
    messagingSenderId: '1096841170679',
    projectId: 'thera-bot-606dd',
    databaseURL: 'https://thera-bot-606dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thera-bot-606dd.appspot.com',
    iosBundleId: 'com.example.gpaiTherapySession',
  );
}
