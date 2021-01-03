import 'package:flutter/material.dart';
import 'package:keva_health/UI/splashPage.dart';

void main() {
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
            ThemeData(fontFamily: 'Poppins-Normal', canvasColor: Colors.white),
        home: SplashPage());
  }
}
