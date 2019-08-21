import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

// ignore: must_be_immutable
class MyHomePage extends State<MyApp> {
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
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      child: Column(
                    children: <Widget>[
                      Image.asset('assets/bg.jpeg'),
                    ],
                  )),
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                    ),
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.flag,
                    ),
                    title: Text('Reservation'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.format_list_bulleted,
                    ),
                    title: Text('My Bookings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contact_phone,
                    ),
                    title: Text('Contact Us'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
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
                                onCreditCardModelChange: onCreditCardModelChange,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(130.0, 20.0, 130.0, 20.0),

                              child: ProgressButton(
                                progressWidget: const CircularProgressIndicator(),
                                color: Colors.lightGreen,
                                width: 40,
                                height: 40,

                                onPressed: () async {
                                  int score = await Future.delayed(
                                      const Duration(milliseconds: 3000), () => 42);
                                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                                  return () {
                                    // Optional returns is returning a function that can be called
                                    // after the animation is stopped at the beginning.
                                    // A best practice would be to do time-consuming task in [onPressed],
                                    // and do page navigation in the returned function.
                                    // So that user won't missed out the reverse animation.
                                  };
                                }, defaultWidget: null,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Icon(
                      Icons.phone_iphone,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
            )));
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
