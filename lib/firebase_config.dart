import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class FirebaseConfig {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGSWA74Wd7bn2DirY78KxPhjYIUddVYHM',
    appId: '1:1079433189609:android:7ef9dd15bb326690a1b878',
    messagingSenderId: '1079433189609',
    projectId: 'biomasbrasil-1dff3',
    storageBucket: 'biomasbrasil-1dff3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAFgdNs6Xe59wj6v0IWRAsl7wMQXsLazQ',
    appId: '1:1079433189609:ios:f48e15e117d1f7e3a1b878',
    messagingSenderId: '1079433189609',
    projectId: 'biomasbrasil-1dff3',
    storageBucket: 'biomasbrasil-1dff3.appspot.com',
    iosBundleId: 'com.example.biomasBrasil',
  );
}
