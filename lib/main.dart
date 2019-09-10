// Author - N.W.R.Amasha
//created Date - 28/7/2019
//TITLE -Splash Screen

import 'dart:async';
import 'package:flutter/material.dart';

//pages
//import 'package:flutter_app/Views/HomeScreen.dart';
//
//import 'Models/Schedules.dart';

void main(){
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String,WidgetBuilder>{
    '/HomeScreen' :(BuildContext context) => null//new HomeScreen()
  },
  ));
}
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  startTime() async{
    var _duration =new Duration(seconds: 2);
    return new Timer(_duration,navigationPage);
    
  }
  void navigationPage(){
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  void initState(){
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: BoxDecoration(

          image: DecorationImage(
              image: AssetImage('assets/SplashScreen .png'),
              fit: BoxFit.cover
          ),
        ),
      )
    );
  }
}