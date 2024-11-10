import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDZVbUhBzKy6bpWZtKiKlnJMlcGYPPS81I",
            authDomain: "groupworkout-ce8ee.firebaseapp.com",
            projectId: "groupworkout-ce8ee",
            storageBucket: "groupworkout-ce8ee.appspot.com",
            messagingSenderId: "269245752502",
            appId: "1:269245752502:web:cbac5c10c656b56605f217",
            measurementId: "G-60KHJSDQZT"));
  } else {
    await Firebase.initializeApp();
  }
}
