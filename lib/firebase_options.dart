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
    apiKey: 'AIzaSyApYRIa3ZBRztYVEGLzbErFGLgR4F20rd0',
    appId: '1:119922447613:web:125328650f73cd91be5a94',
    messagingSenderId: '119922447613',
    projectId: 'seatuersih',
    authDomain: 'seatuersih.firebaseapp.com',
    storageBucket: 'seatuersih.appspot.com',
    measurementId: 'G-EC4B9TBZC0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7zvw0SvLFvtx7CvZXjx_YMQ2RNTBl5Qw',
    appId: '1:119922447613:android:3d3e0212448016f5be5a94',
    messagingSenderId: '119922447613',
    projectId: 'seatuersih',
    storageBucket: 'seatuersih.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtvTDoAmy65ImE-kqhnhjV7Es2aRGUeKI',
    appId: '1:119922447613:ios:e7132eb6773174ffbe5a94',
    messagingSenderId: '119922447613',
    projectId: 'seatuersih',
    storageBucket: 'seatuersih.appspot.com',
    iosBundleId: 'com.example.seatuErsihAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtvTDoAmy65ImE-kqhnhjV7Es2aRGUeKI',
    appId: '1:119922447613:ios:e7132eb6773174ffbe5a94',
    messagingSenderId: '119922447613',
    projectId: 'seatuersih',
    storageBucket: 'seatuersih.appspot.com',
    iosBundleId: 'com.example.seatuErsihAdmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyApYRIa3ZBRztYVEGLzbErFGLgR4F20rd0',
    appId: '1:119922447613:web:aa5f7c9a791a2516be5a94',
    messagingSenderId: '119922447613',
    projectId: 'seatuersih',
    authDomain: 'seatuersih.firebaseapp.com',
    storageBucket: 'seatuersih.appspot.com',
    measurementId: 'G-R52L87J65C',
  );
}
