// Author - N.W.R.Amasha
//created Date - 5/8/2019
//TITLE -user login


/*
  * User Enters Phone Number or email
  * User clicks on 'forgotten password'
  * User clicks on register
  * User login into the System
  * *No validation done..only checking if the user exists in the database*
 */

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//pages
import'package:train/Models/User.dart';
import 'Register.dart';
import 'payment.dart';
import 'HomeScreen.dart';
import 'Drawer.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}
enum FormType{
  login,register
}
class _LoginPageState extends State<LoginPage> {
  final _emailFilter = new TextEditingController();
  final _pswFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _pswFilter.addListener(_pswListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _pswListen() {
    if (_pswFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _pswFilter.text;
    }
  }

  //connecting API

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[800],
        accentColor: Colors.cyan[600],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        drawer: DrawerState(),
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildTitle(),
                  _buildTextFields(),
                  _buildButtons(),

                ],
              ),
            )
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(

      padding: EdgeInsets.all(10.0),
      child: Stack(

        children: <Widget>[

          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            decoration: BoxDecoration(

              image: DecorationImage(
                  image: AssetImage('assets/image.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Colors.indigo.withOpacity(0.4), BlendMode.darken),
                  fit: BoxFit.cover
              ),
            ),
          ),

          Text('Sign Up!',
            style: TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      padding: EdgeInsets.all(15.0),
      child: Column(

        children: <Widget>[
          Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: InputDecoration(
                  labelText: "Email or Phone Number"
              ),
            ),
          ),
          Container(
            child: new TextField(
              controller: _pswFilter,
              decoration: InputDecoration(
                  labelText: "Password"
              ),
              obscureText: true,
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: FlatButton(
                onPressed: _pswReset,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              color: Colors.blueAccent,
              onPressed: () => _loginPressed(),
              child: Text('Login',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white
                ),
              ),
            ),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Haven\'t Registered yet?'),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => RegisterPage())
                        );
                      },
                      child: Text('REGISTER',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                )

            )
          ],
        )

    );
  }

  void _pswReset() {
    print("The user wants a password reset request sent to $_email");
  }

  
  Future<List> _loginPressed() async {
    final  response= await http.post("http://10.0.2.2/admin_TrainApp/login.php",
    body: {
      "userEmail": _emailFilter.text,
      "userPassword" : _pswFilter.text
    }
    );
   var dataUser= json.decode(response.body);

   if(dataUser.length == 0){
     setState(() {
       showDialog(context: context,
        builder: (context){
         return AlertDialog(
           title: Text('Error'),
           content: Text('User doesn\'t exist'),
           actions: <Widget>[
             FlatButton(
             child: Text('Ok'),
             onPressed: (){Navigator.pop(context);},
         ),
           ],
         );
        }
       );
     });
   }else{
     Navigator.push(
         context,
         new MaterialPageRoute(
             builder: (context) => MyApp())

         );
   }
  }
}
