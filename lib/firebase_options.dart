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
    apiKey: 'AIzaSyCXlK0O7bpA_1b8T256XMeHabmlmoHf1l8',
    appId: '1:1005535174877:web:91497159abf4d7834dfb34',
    messagingSenderId: '1005535174877',
    projectId: 'notestask-baafd',
    authDomain: 'notestask-baafd.firebaseapp.com',
    storageBucket: 'notestask-baafd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwSuHrLHeZmaH-6wa11IO-4g2KyJqs2Xs',
    appId: '1:1005535174877:android:e4fc87884f6eaa654dfb34',
    messagingSenderId: '1005535174877',
    projectId: 'notestask-baafd',
    storageBucket: 'notestask-baafd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD624iCHmFhelLpTcpALxTJ0-4azxU8Y8',
    appId: '1:1005535174877:ios:9e8f5c082fa6b5254dfb34',
    messagingSenderId: '1005535174877',
    projectId: 'notestask-baafd',
    storageBucket: 'notestask-baafd.appspot.com',
    iosClientId: '1005535174877-u8389c6q18rcf0abbdmklpdtvijhvhop.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD624iCHmFhelLpTcpALxTJ0-4azxU8Y8',
    appId: '1:1005535174877:ios:b48c32ad237852c44dfb34',
    messagingSenderId: '1005535174877',
    projectId: 'notestask-baafd',
    storageBucket: 'notestask-baafd.appspot.com',
    iosClientId: '1005535174877-ti50neaqh0ertssvqphine9vp3iqsh3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesTask.RunnerTests',
  );
}
