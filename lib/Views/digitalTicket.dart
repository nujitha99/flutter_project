import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:train/Views/profile.dart';


void main() => runApp(DigitalTicket());

class DigitalTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DigitalTicketState();
  }
}

class DigitalTicketState extends State<DigitalTicket> {
  final String data = "0002";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue[800],
          accentColor: Colors.cyan[600],
          textTheme:
              TextTheme(body1: TextStyle(color: Colors.black, fontSize: 20.0))),
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
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Profile()));
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
            color: Colors.white,
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/qrbg.jpeg',
                      height: 150.0,
                      width: 200.0,
                      fit: BoxFit.fill,
                    ),
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
                          'Start    : ',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Text('Wellawatte')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'End      : ',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Text('Galle')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'No. of Seats : ',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
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
                              Text(
                                'Payment : ',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text('Paid')
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Total : ',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
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
                        Text(
                          'Reference Number : ',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(data)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Scan this",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        QrImage(
                          data: data,
                          gapless: true,
                          size: 200,
                          errorCorrectionLevel: QrErrorCorrectLevel.M,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
