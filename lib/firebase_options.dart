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
    apiKey: 'AIzaSyCNEVArnRzRAjRgkJM_-sYv9e1qDuhvS8c',
    appId: '1:489805048875:web:cec7fde965c58dc85d4e6e',
    messagingSenderId: '489805048875',
    projectId: 'chat-app2-f9926',
    authDomain: 'chat-app2-f9926.firebaseapp.com',
    storageBucket: 'chat-app2-f9926.appspot.com',
    measurementId: 'G-EVN8JE1G64',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqPIWgJTZxtUsOh_6zaG7LtT978bL7IA0',
    appId: '1:489805048875:android:f9e3333fb46413ae5d4e6e',
    messagingSenderId: '489805048875',
    projectId: 'chat-app2-f9926',
    storageBucket: 'chat-app2-f9926.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCK6lq9fgf2YIn5tgZb9Mf60LMc0K-UgaI',
    appId: '1:489805048875:ios:905306981902b1655d4e6e',
    messagingSenderId: '489805048875',
    projectId: 'chat-app2-f9926',
    storageBucket: 'chat-app2-f9926.appspot.com',
    iosClientId: '489805048875-ggbevsotuvc854e6s3vns26d3rq02bf4.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCK6lq9fgf2YIn5tgZb9Mf60LMc0K-UgaI',
    appId: '1:489805048875:ios:a8fb0ba7aa7b28e35d4e6e',
    messagingSenderId: '489805048875',
    projectId: 'chat-app2-f9926',
    storageBucket: 'chat-app2-f9926.appspot.com',
    iosClientId: '489805048875-ponl9elbm7fc1acdcboc0lc8l69ithme.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp2.RunnerTests',
  );
}