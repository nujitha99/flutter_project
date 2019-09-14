import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

//pages
import 'MyBooking.dart';

//void main() => runApp(DigitalTicket());

class DigitalTicket extends StatefulWidget {
  String user;
  String start;
  String end;
  String trainName;
  String date;
  String payment;
  String refno;
  DigitalTicket({Key key, @required this.user,this.start, this.end, this.date,this.payment,this.trainName,this.refno})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DigitalTicketState(user,start,end,date,payment,trainName,refno);
  }
}

class DigitalTicketState extends State<DigitalTicket> {
  String user;
  String start;
  String end;
  String trainName;
  String date;
  String payment;
  String refno;
  DigitalTicketState(this.user,this.start, this.end, this.date,this.payment,this.trainName,this.refno);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue[800],
          accentColor: Colors.cyan[600],
          textTheme:
              TextTheme(body1: TextStyle(color: Colors.white, fontSize: 16.0))),
      home: Scaffold(
          appBar: new AppBar(
            title: Text('My Recent Booking'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyBookingPage()));
                }),
          ),
          body: Container(
            color: Colors.white,
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/scanner.jpg',
                      fit: BoxFit.fill,
                      height: 150.0,
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Name  : ',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text('$user')
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
                                      'Start    : ',
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                    Text('$start'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'End     : ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                    Text(
                                      '$end',
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Train Name : ',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text('$trainName')
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 50.0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Date : ',
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  Text('$date')
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Total : ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                    Text(
                                      '$payment',
                                      textAlign: TextAlign.right,
                                    )
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
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Text('$refno')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Scan the QR below",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        QrImage(
                          data: refno,
                          gapless: true,
                          size: 150,
                          errorCorrectionLevel: QrErrorCorrectLevel.H,
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
