import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'digitalTicket.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

// ignore: must_be_immutable
class MyHomePage extends State<MyApp> {
  bool checkBox = false;
  GlobalKey _globalKeyCard = new GlobalKey();
  GlobalKey _globalKeyMobile = new GlobalKey();
  int _state = 0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

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
            appBar: new AppBar(
              title: Text('Payment'),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
            ),

            body: new DefaultTabController(
              length: 2,
              child: new Scaffold(
                appBar: new AppBar(
                  actions: <Widget>[],
                  title: new TabBar(
                    tabs: [
                      new Tab(
                        icon: new Icon(Icons.credit_card),
                        text: 'Credit Card',
                      ),
                      new Tab(
                        icon: new Icon(Icons.phone_iphone),
                        text: 'Mobile Credit',
                      ),
                    ],
                    indicatorColor: Colors.white,
                  ),
                ),
                body: new TabBarView(
                  children: [
                    new Container(
                      color: Colors.white,
                      child: SafeArea(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                              color: Colors.lightGreen,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Total : Rs. 200',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: CreditCardWidget(
                                cardNumber: cardNumber,
                                expiryDate: expiryDate,
                                cardHolderName: cardHolderName,
                                cvvCode: cvvCode,
                                showBackView: isCvvFocused,
                              ),
                            ),
                            Container(
                              child: CreditCardForm(
                                onCreditCardModelChange:
                                onCreditCardModelChange,
                              ),
                            ),
                            Container(
                              child: new PhysicalModel(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25.0),
                                child: new MaterialButton(
                                  key: _globalKeyCard,
                                  child: setUpButtonChild(),
                                  onPressed: () {
                                    setState(() {
                                      if (_state == 0) {
                                        animateButton();
                                      }
                                    });
                                  },
                                  elevation: 4.0,
                                  minWidth: double.infinity,
                                  height: 48.0,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      color: Colors.grey[300],
                      child: SafeArea(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'assets/dialog.png',
                                height: 100,
                                width: 150,
                              ),
                            ),
                            Container(
                              child: Text(
                                '*This facility is currently available for the Dialog users only',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(80.0),
                              child: Text(
                                'Total : Rs. 200',
                                style: TextStyle(
                                    fontSize: 30.0, color: Colors.black),
                              ),
                            ),
                            Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Colors.black,
                                      checkColor: Colors.lightGreen,
                                      value: checkBox,
                                      onChanged: (bool value) {
                                        setState(() {
                                          checkBox = value;
                                        });
                                      },
                                    ),
                                    Container(
                                      child: Text(
                                        'I agree to pay using my mobile credit',
                                        style: TextStyle(color: Colors.black),
                                        softWrap: true,
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: new PhysicalModel(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25.0),
                                child: new MaterialButton(
                                  key: _globalKeyMobile,
                                  child: setUpButtonChild(),
                                  onPressed: () {
                                    setState(() {
                                      if (_state == 0) {
                                        animateButton();
                                      }
                                    });
                                  },
                                  elevation: 4.0,
                                  minWidth: double.infinity,
                                  height: 48.0,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Pay",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      //changes made 9/10/2019 by N.W.R.Amasha
      //Navigate to the ticket screen
      return IconButton(
          icon: Icon(Icons.check),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> DigitalTicket()));
          });
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _state = 2;
      });
    });
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}