// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return macos;
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
    apiKey: 'AIzaSyAfHjj3-o_uXM48ZsEufdkbmbwP3ubKKzQ',
    appId: '1:978216473678:web:f300f6adee887b63ca9f1f',
    messagingSenderId: '978216473678',
    projectId: 'facillita',
    authDomain: 'facillita.firebaseapp.com',
    storageBucket: 'facillita.appspot.com',
    measurementId: 'G-Y20SFRGEG9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2D5Q7G__W42yLjyYGAkMLeR-S_bVsiT0',
    appId: '1:978216473678:android:fd6cef8124822d80ca9f1f',
    messagingSenderId: '978216473678',
    projectId: 'facillita',
    storageBucket: 'facillita.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhl7-DWQ8zhjzn-CoCPygowksYu5WAkKQ',
    appId: '1:978216473678:ios:ec74ede911425136ca9f1f',
    messagingSenderId: '978216473678',
    projectId: 'facillita',
    storageBucket: 'facillita.appspot.com',
    iosBundleId: 'com.example.facilitaProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhl7-DWQ8zhjzn-CoCPygowksYu5WAkKQ',
    appId: '1:978216473678:ios:ae899519b0d1d06fca9f1f',
    messagingSenderId: '978216473678',
    projectId: 'facillita',
    storageBucket: 'facillita.appspot.com',
    iosBundleId: 'com.example.facilitaProject.RunnerTests',
  );
}
