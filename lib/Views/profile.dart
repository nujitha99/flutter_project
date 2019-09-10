import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train/Views/Drawer.dart';

void main() => runApp(Profile());

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue[800],
          accentColor: Colors.cyan[600],
          textTheme: TextTheme(body1: TextStyle(color: Colors.white70, fontSize: 20.0))
      ),
      home: new Scaffold(
        appBar: AppBar(title: Text('Profile')),
        drawer: drawer(),
        body: Container(
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(30.0),
                  child: Image.asset('assets/man.png', height: 100.0, width: 100.0,),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Name   : ',
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      Text('Alex John')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Phone  : ',
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      Text('0771234567')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Email   : ',
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      Text('alex@mail.com')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'NIC      : ',
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      Text('123456789v')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.lightGreen,
                        textColor: Colors.black,
                        disabledColor: Colors.lightGreen,
                        disabledTextColor: Colors.black,
                        onPressed: null,
                        child: Text('Edit Details'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}