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
    apiKey: 'AIzaSyDCeX5clIl0C-ksBQX2cuzNC0rN09FQbGA',
    appId: '1:791042531175:web:5acc359cbf9f1fbb7bd9c2',
    messagingSenderId: '791042531175',
    projectId: 'socialmedia-5d0e4',
    authDomain: 'socialmedia-5d0e4.firebaseapp.com',
    databaseURL: 'https://socialmedia-5d0e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socialmedia-5d0e4.appspot.com',
    measurementId: 'G-MYQ7PTVX59',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVdg7-G10cGO23AsNJsEekucZgLDRt2fI',
    appId: '1:791042531175:android:9c9f03cea3d3d6627bd9c2',
    messagingSenderId: '791042531175',
    projectId: 'socialmedia-5d0e4',
    databaseURL: 'https://socialmedia-5d0e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socialmedia-5d0e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVnZMFx8NFjJW7zzRKzrROmrUDLjUpq0g',
    appId: '1:791042531175:ios:b8bdc1a1b84228e77bd9c2',
    messagingSenderId: '791042531175',
    projectId: 'socialmedia-5d0e4',
    databaseURL: 'https://socialmedia-5d0e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socialmedia-5d0e4.appspot.com',
    iosBundleId: 'com.example.socialmedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVnZMFx8NFjJW7zzRKzrROmrUDLjUpq0g',
    appId: '1:791042531175:ios:4b42f419ce4feb857bd9c2',
    messagingSenderId: '791042531175',
    projectId: 'socialmedia-5d0e4',
    databaseURL: 'https://socialmedia-5d0e4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socialmedia-5d0e4.appspot.com',
    iosBundleId: 'com.example.socialmedia.RunnerTests',
  );
}
