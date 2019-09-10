// Author - N.W.R.Amasha
//created Date - 28/7/2019
//TITLE - Drawer

import 'package:flutter/material.dart';

//pages
import 'MyBooking.dart';
import 'HomeScreen.dart';
import 'SearchDelegate.dart';
import 'Register.dart';
import 'Login.dart';
import 'package:train/main.dart';
import 'TrainDetails.dart';
import 'SeatBooking.dart';


class drawer extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return new Drawer(

          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('EasyTravel'),
                decoration: BoxDecoration(

                  color: Color(0xFF2d3447),
                ),
              ),
              new ListTile(
                title: new Text('Home'),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => HomeScreen())
                  );
                },
              ),
              new Divider(
                color: Colors.black26,
              ),

              new ListTile(
                title: new Text('MyBooking'),
                trailing: new Icon(Icons.history),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyBookingPage())
                  );
                },
              ),
              new Divider(
                color: Colors.black26,
              ),
              new ListTile(
                title: new Text('Profile'),
                trailing: new Icon(Icons.people),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SeatBookingPage() )
                  );
                },

              ),
              new Divider(
                color: Colors.black26,
              ),
              new ListTile(
                title: new Text('Register'),

                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => RegisterPage())
                  );
                },

              ),
              new ListTile(
                title: new Text('Login'),

                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => LoginPage())
                  );
                },

              ),
            ],
          ),

        );

  }
}