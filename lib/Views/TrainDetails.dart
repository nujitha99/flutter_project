// Author - N.W.R.Amasha
////created Date - 15/8/2019
////TITLE - Train Details Screen(SCREEN 2)

/*
    * Shows the train schedules according to departure,arrival and date
 */

import 'package:flutter/material.dart';
//import 'package:flutter_app/Models/Schedules.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//pages
import 'SeatBooking.dart';

class TrainDetailsPage extends StatefulWidget {
  String start;
  String end;
  String date;
  TrainDetailsPage({Key key,@required this.start,this.end,this.date}):super(key :key);
  @override
  TrainDetails createState() =>  new TrainDetails(start,end,date);
}


class TrainDetails extends State<TrainDetailsPage> {
  final String startingPoint ;
  final String endingPoint;
  final String date;
  TrainDetails(this.startingPoint,this.endingPoint,this.date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace:FlexibleSpaceBar(
              background: MyFlexibleSpaceBar(start: startingPoint,end:endingPoint,date: date,),

            ) ,
            backgroundColor: Color(0xFF2d3447),
          ),
          SliverFillRemaining(
            child :Container(
              color: Color(0xFF2d3447),
              child: schedule(),




            ),
          )
        ],
      ),
    );
  }
}
class MyFlexibleSpaceBar extends StatelessWidget{
  String start;
  String end;
  String date;
  MyFlexibleSpaceBar({Key key,@required this.start,this.end,this.date}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage('assets/bgImage.jpg'),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.multiply),
            fit: BoxFit.cover
        ),
      ),
      child: new Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: new Text('Train schedules ',
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
            Container(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  Container(

                    child: Icon(
                      FontAwesomeIcons.mapMarkerAlt, color: Colors.white,size: 30.0,
                    ),
                  ),
                  Container(

                    child: new Text("$start - $end",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 28.0
                      ),
                    ),
                  ),

                ],
              ),

            ),
            Container(
              child: new Text(
                '$date',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

class schedule extends StatefulWidget{
  @override
  _scheduleState createState() => new _scheduleState();
}
class _scheduleState extends State<schedule>{
  Future<List<Data>> _getData() async{
    var res =await http.get("http://ec2-18-221-114-73.us-east-2.compute.amazonaws.com:8080/api/search");

    var jsonData =json.decode(res.body);

    List<Data> datalst=[];
    for(var item in jsonData){
      Data data = Data(item["trainID"],item["journeyDestinations"]);
      datalst.add(data);
    }
    print(datalst.length);
    return datalst;
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:FutureBuilder(
        future: _getData(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.data ==null){
            return Container(
              child: Center(
                child: Text("Loading....",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),),
              ),
            );
          }else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(

                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data[index].catName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.0
                                  ),),
                                Text('1016',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.0
                                  ),
                                ),
                                Text('First Class',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12.0
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(

                            padding: EdgeInsets.all(8.0),
                            child: Column(

                              children: <Widget>[
                                Text('8:15 AM'),
                                Text('Departure',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0
                                  ),
                                ),
                                Text('Time',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(

                              children: <Widget>[
                                Text('10:15 AM'),
                                Text('Arrival',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0
                                  ),
                                ),
                                Text('Time',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(

                              child: IconButton(
                                  icon: Icon(Icons.navigate_next,
                                    color: Colors.blue,),
                                  onPressed: () {
                                     Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => SeatBookingPage())
                                );
                                  })
                          )


                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
class Data{
 // final int journeyId;
  final String trainId;
  final String journeyDestinations;
 // final String journeyTime;
  Data(this.trainId,this.journeyDestinations);

}
