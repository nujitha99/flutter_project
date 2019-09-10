import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomeScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),

  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new HomeScreen(),
        title: new Text(
          'Easy Travel',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        loadingText: Text('Loading Now'),
        photoSize: 100.0,
        loaderColor: Colors.blue);
  }
}


