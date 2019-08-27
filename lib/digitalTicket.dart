import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(DigitalTicket());

class DigitalTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DigitalTicketState();
  }
}

class DigitalTicketState extends State<DigitalTicket> {
  final String data = "12345678";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[800],
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black, fontSize: 20.0)
        )
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text('My Recent Booking'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/bg.jpeg'),
              ),
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
        body: Container(
          color: Colors.grey[200],
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Name  : '),
                      Text('Alex John')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Start    : '),
                      Text('Wellawatte')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text('End      : '),
                      Text('Galle')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text('No. of Seats : '),
                      Text('1')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 30.0, 0),
                        child: Row(
                          children: <Widget>[
                            Text('Payment : '),
                            Text('Paid')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Text('Total : '),
                            Text('200')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Reference Number : '),
                      Text(data)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Scan this",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16,),

                    QrImage(
                      data: data,
                      gapless: true,
                      size: 250,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    )
                  ],
                ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
