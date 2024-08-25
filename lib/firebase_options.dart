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
    apiKey: 'AIzaSyAQZPaLl_-JTQKNpPUipW7St78ROO6faog',
    appId: '1:67990779398:web:d472b7f01e6c4909133587',
    messagingSenderId: '67990779398',
    projectId: 'momentmaster-13fd4',
    authDomain: 'momentmaster-13fd4.firebaseapp.com',
    storageBucket: 'momentmaster-13fd4.appspot.com',
    measurementId: 'G-PCFVCKQJVV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVxouZ1h4SjmBNvjCJA91VwsNnLkkssvI',
    appId: '1:67990779398:android:bec9bacdfb8379ea133587',
    messagingSenderId: '67990779398',
    projectId: 'momentmaster-13fd4',
    storageBucket: 'momentmaster-13fd4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGXO9TBqS_xuQ9-OIlSiEl9Tz2EEUE6q0',
    appId: '1:67990779398:ios:328a401b259d6186133587',
    messagingSenderId: '67990779398',
    projectId: 'momentmaster-13fd4',
    storageBucket: 'momentmaster-13fd4.appspot.com',
    iosBundleId: 'com.viren.momentmaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGXO9TBqS_xuQ9-OIlSiEl9Tz2EEUE6q0',
    appId: '1:67990779398:ios:328a401b259d6186133587',
    messagingSenderId: '67990779398',
    projectId: 'momentmaster-13fd4',
    storageBucket: 'momentmaster-13fd4.appspot.com',
    iosBundleId: 'com.viren.momentmaster',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQZPaLl_-JTQKNpPUipW7St78ROO6faog',
    appId: '1:67990779398:web:eb81e20341365361133587',
    messagingSenderId: '67990779398',
    projectId: 'momentmaster-13fd4',
    authDomain: 'momentmaster-13fd4.firebaseapp.com',
    storageBucket: 'momentmaster-13fd4.appspot.com',
    measurementId: 'G-4GMZYD9T85',
  );
}