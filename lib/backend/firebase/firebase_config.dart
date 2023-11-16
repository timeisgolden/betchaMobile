import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAGJjeXKhPobG3FGvqab06pXdAmEnoEI3Q",
            authDomain: "betcha-test.firebaseapp.com",
            projectId: "betcha-test",
            storageBucket: "betcha-test.appspot.com",
            messagingSenderId: "929880995383",
            appId: "1:929880995383:web:f8a8152bd2becbb02231b2",
            measurementId: "G-PBMQG3PFKJ"));
  } else {
    await Firebase.initializeApp();
  }
}
