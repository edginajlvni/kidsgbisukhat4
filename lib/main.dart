import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsgbisukhat4/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBdcLg1jOLr-u7b6GzvFgDJkwQ-yPwU3hw",
          authDomain: "kidsgbisukhat4.firebaseapp.com",
          projectId: "kidsgbisukhat4",
          storageBucket: "kidsgbisukhat4.appspot.com",
          messagingSenderId: "850745654380",
          appId: "1:850745654380:web:be2b64effbc2501a36ec49",
          measurementId: "G-T97WJHRDCR"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(),
      home: const Splash(),
    );
  }
}
