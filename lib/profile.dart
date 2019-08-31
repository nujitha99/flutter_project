import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          textTheme: TextTheme(body1: TextStyle(color: Colors.black, fontSize: 20.0))
      ),
      home: new Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset('assets/man.png', height: 100.0, width: 100.0,),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Name  : ',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Text('Alex John')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Phone  : ',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Text('0771234567')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Email  : ',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Text('alex@mail.com')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'NIC  : ',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Text('123456789')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
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