import 'package:flutter/material.dart';
import 'package:keva_health/UI/splashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Keva Health',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: 'Poppins-Normal', canvasColor: Colors.white,
            
            ),
            
        home: SplashPage());
  }
}
