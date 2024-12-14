// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCZgS94PPKYax4cYOeSXx8WWk4kW2lOj-s',
    appId: '1:302833476086:web:87be02d7e90b8335ce67d7',
    messagingSenderId: '302833476086',
    projectId: 'trendify-16b9a',
    authDomain: 'trendify-16b9a.firebaseapp.com',
    storageBucket: 'trendify-16b9a.firebasestorage.app',
    measurementId: 'G-0SL56DL0J8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWd9zkeI7vAgzOgUse9qWjEaJRqcQ46Z0',
    appId: '1:302833476086:android:49403fd5407f26f8ce67d7',
    messagingSenderId: '302833476086',
    projectId: 'trendify-16b9a',
    storageBucket: 'trendify-16b9a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFdrklNXv2Y3GLhjBM8VEeDekIhxc6QZw',
    appId: '1:302833476086:ios:c78dc3fa61c30e30ce67d7',
    messagingSenderId: '302833476086',
    projectId: 'trendify-16b9a',
    storageBucket: 'trendify-16b9a.firebasestorage.app',
    iosBundleId: 'com.example.trendify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFdrklNXv2Y3GLhjBM8VEeDekIhxc6QZw',
    appId: '1:302833476086:ios:c78dc3fa61c30e30ce67d7',
    messagingSenderId: '302833476086',
    projectId: 'trendify-16b9a',
    storageBucket: 'trendify-16b9a.firebasestorage.app',
    iosBundleId: 'com.example.trendify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZgS94PPKYax4cYOeSXx8WWk4kW2lOj-s',
    appId: '1:302833476086:web:e6ca338e816fbd2bce67d7',
    messagingSenderId: '302833476086',
    projectId: 'trendify-16b9a',
    authDomain: 'trendify-16b9a.firebaseapp.com',
    storageBucket: 'trendify-16b9a.firebasestorage.app',
    measurementId: 'G-RP2RGQ2BBW',
  );
}
