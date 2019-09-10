// Author - N.W.R.Amasha
//created Date - 28/7/2019
//TITLE -Splash Screen

import 'dart:async';
import 'package:flutter/material.dart';

//pages
import 'package:train/Views/HomeScreen.dart';
import 'package:train/Views/splashScreen.dart';
//
//import 'Models/Schedules.dart';

void main(){
  runApp(new MaterialApp(
    home: MyApp(),
    routes: <String,WidgetBuilder>{
    '/HomeScreen' :(BuildContext context) => new HomeScreen()
  },
  ));
}

