// Author - N.W.R.Amasha
//created Date - 5/8/2019
//TITLE -user login

/*
    *User can view all the bookings had done
    * The data is passed from the database
    * User can view the mobile ticket screen
    * The data shown in the card are date the booking done,departure,arrival,time,date,ref no

 */

//import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//pages
import 'digitalTicket.dart';


class MyBookingPage extends StatelessWidget{
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
          title: Text('MyBooking'),
        ),
        body: Center(
          child :Container(
            // height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  IntroImage(),
                  MyBookingState()

                ],
              )
          ),
        ),
      ),
    );
  }
}

//------Passing data from the database--------------
class MyBookingState extends StatefulWidget{
  @override
  _MyBookingState createState()=> new _MyBookingState();
}
class _MyBookingState extends State<MyBookingState>{
  Future<List> getData() async{
    final response = await http.get("http://10.0.2.2/admin_TrainApp/get.php");
    return json.decode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
        //  print('in');
          if(snapshot.hasError) print(snapshot.hasError);
          return snapshot.hasData?
              new CardList(list:snapshot.data)
              :new Center(child: new CircularProgressIndicator(),);
        }

    );
  }
}
//-----------ListView Builder & Card Details---------------------
class CardList extends StatelessWidget{
  final List list;
  CardList({this.list});


  @override
  Widget build(BuildContext context) {
   print(list.length);

    return new Container(
      height: MediaQuery.of(context).size.height/1.5,
      child: new ListView.builder(
        scrollDirection: Axis.vertical,

        shrinkWrap: true,
        itemCount: list == null? 0: list.length,
        itemBuilder: (context,i){
          // print(list[i]['departure']);
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Card(
              //margin: EdgeInsets.all(10.0),
              child: Container(
                height: 200.0,
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(list[i]['bookingDate'],
                          style: TextStyle(
                              color: Colors.black38
                          ),),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[


                              Text(list[i]['departure'],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300
                                ),


                              ),
                              Text(list[i]['departureTime'],
                              ),
                              Text('Departure',
                                style: TextStyle(
                                    color: Colors.black38
                                ),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(list[i]['arrival'],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300
                                ),),
                              Text(list[i]['arrivalTime']),
                              Text('Arrival',
                                style: TextStyle(
                                    color: Colors.black38
                                ),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                          child: Column(
                            children: <Widget>[
                              Text('REF NO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0
                                ),),
                              Text(list[i]['refNo'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),)
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Date - ${list[i]['date']}'),

                      ],
                    ),
                    Divider(color: Colors.black38,),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: OutlineButton(onPressed: (){
                          Navigator.push(context,  new MaterialPageRoute(
                              builder: (context) => DigitalTicket())
                          );
                        },
                          child: Text('View Ticket',
                            style: TextStyle(
                                color: Colors.blue
                            ),),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}



class IntroImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/MenuImg1.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          fit: BoxFit.cover,

        ),
        Container(
          padding: EdgeInsets.all(10.0),
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,

          children: <Widget>[

            Text('Keep a list of where to travel',
            style: TextStyle(
              color: Colors.black54,
                  fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),),
            Text('Reserve more,Travel more',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0
              ),)
          ],
        ),)
      ],
    );
  }
}