import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
                    new Card(
                      color: Colors.white,
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
                            CreditCardWidget(
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                              showBackView: isCvvFocused,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: CreditCardForm(
                                  onCreditCardModelChange: onCreditCardModelChange,
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    new Icon(
                      Icons.ac_unit,
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
