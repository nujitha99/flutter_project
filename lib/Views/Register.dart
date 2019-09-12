// Author - N.W.R.Amasha
//created Date - 5/8/2019
//TITLE - register page

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



class RegisterPage  extends StatefulWidget{
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final formKey = new GlobalKey<FormState>();

  final _nameFilter = new TextEditingController();
  final _emailFilter = new TextEditingController();
  final _phoneFilter = new TextEditingController();
  final _pswFilter = new TextEditingController();
  final _rePswFilter = new TextEditingController();

  String _name = "";
  String _phoneNumber = "";
  String _email = "";
  String _password = "";
  String _rePassword = "";

  _RegisterPageState() {
    _nameFilter.addListener(_nameListen);
    _phoneFilter.addListener(_phoneNumberListen);
    _emailFilter.addListener(_emailListen);
    _pswFilter.addListener(_pswListen);
    _rePswFilter.addListener(_rePswListen);
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _phoneNumberListen(){
    if(_phoneFilter.text.isEmpty){
      _phoneNumber="";
    }else{
      _phoneNumber = _phoneFilter.text;
    }
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

  void _rePswListen() {
    if (_rePswFilter.text.isEmpty) {
      _rePassword = "";
    } else {
      _rePassword = _rePswFilter.text;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[800],
        accentColor: Colors.cyan[600],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildTitle(),
                  _Form(),

                ],
              ),
            )

        ),
      ),



    );
  }

  Widget _Form() {
    // TODO: implement build
    return Center(

      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: new Form(
            key: formKey,
            child: Column(

              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Wrap(

                    children: <Widget>[
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _nameFilter,
                        decoration: InputDecoration(
                          labelText: 'Your name',

                          focusedBorder: UnderlineInputBorder(),

                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _phoneFilter,
                        decoration: InputDecoration(
                          labelText: 'Your phone number',

                          focusedBorder: UnderlineInputBorder(),


                        ),
                        validator: (val) =>
                        val.length < 10 ? 'Password should be 7 digits' : null,
                        onSaved: (val) => _phoneNumber = val,
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: _emailFilter,
                        decoration: InputDecoration(
                          labelText: 'Email',

                          focusedBorder: UnderlineInputBorder(),

                        ),

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _pswFilter,
                        decoration: InputDecoration(
                          labelText: 'Password',

                          focusedBorder: UnderlineInputBorder(),

                        ),
                        obscureText: true,
                        validator: (val) =>
                        val.length < 6 ? 'Password should be 7 digits' : null,
                        onSaved: (val) => _password = val,
                      ),

                      SizedBox(height: 30,),

                      TextFormField(
                        controller: _rePswFilter,
                        decoration: InputDecoration(
                          labelText: 'Re-enter password',

                          focusedBorder: UnderlineInputBorder(),

                        ),
                        validator: (val) =>
                        val != _password ? 'The password does not match' : null,
                        onSaved: (val) => _rePassword = val,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                    color: Colors.blueAccent,
                    onPressed: _validatePsw,
                    child: Text('Register',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white
                      ),
                    ),
                  ),

                )
                , SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'By continuing,you agree to Conditions of Use and Privacy Notice',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                )

              ],
            ),
          ),
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
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(

              image: DecorationImage(
                  image: AssetImage('assets/loginImg.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Colors.indigo.withOpacity(0.4), BlendMode.darken),
                  fit: BoxFit.cover
              ),
            ),
          ),

          Text('Register Now!',
            style: TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  void _validatePsw() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
    }
    print("check if the $_password word is similar to $_rePassword");
    print("The user is $_name and $_email");
    addData();
  }
  void addData(){
    var url ="http://10.0.2.2/admin_TrainApp/register.php";

    http.post(url,body:{
      "userName" : _nameFilter.text,
      "phoneNumber" : _phoneFilter.text,
      "userEmail" : _emailFilter.text,
      "userPassword" : _rePswFilter.text
    });
  }


}
