import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAPaePPsnCQ_I2MKODe4ofybO_0briJ0X8",
            authDomain: "beyondconsulting-ebbe5.firebaseapp.com",
            projectId: "beyondconsulting-ebbe5",
            storageBucket: "beyondconsulting-ebbe5.appspot.com",
            messagingSenderId: "1009527882445",
            appId: "1:1009527882445:web:54cbedfa27b82b26825f84",
            measurementId: "G-XWNLTMCH8E"));
  } else {
    await Firebase.initializeApp();
  }
}
