// Author - N.W.R.Amasha
//created Date - 18/8/2019
//TITLE - Home Screen

/*
  * User can select the start - end destinations
  * User can select the date
  * User can go into other options('MyBooking & 'Profile')
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

//pages
import 'package:train/Views/Drawer.dart';
import 'package:train/Views/TrainDetails.dart';
import 'package:train/Views/MyBooking.dart';
import 'SearchDelegate.dart';
import 'profile.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2d3447),
        title: Icon(Icons.home),
      ),
      drawer: drawer(),
      body:Container(

        decoration: BoxDecoration(
          //background image
          image: DecorationImage(
              image: AssetImage('assets/bgImage.jpg'),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.multiply),
              fit: BoxFit.cover
          ),
        ),
        child:  Column(
          children: <Widget>[

            //widgets
            Title(),
            SearchForm(),
            MenuItems()

          ],
        ),
      ),

    );
  }
}

//create Searching destinations widget
class SearchForm extends StatefulWidget{
  @override
  _searchView createState() => _searchView();
}

class _searchView extends State<SearchForm>{

  //text field controller
  final format = DateFormat("yyyy-MM-dd");
  final date = TextEditingController();
  final startingPoint =TextEditingController();
  final endingPoint =TextEditingController();

  //final endPoint =TextEditingController();
  //final date =TextEditingController();
  //var start;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 150),
        padding: EdgeInsets.all(20.0),
        width: 360,
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextField(
              onTap: (){getStartingPoint(context);},
              controller: startingPoint,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                icon: Icon(Icons.my_location,color: Colors.white),
                border: OutlineInputBorder(),
                labelText: 'Choose the starting point',

                // labelStyle: TextStyle(color: Colors.white)
              ),

              //controller: start,
            ),
            SizedBox(height: 5,),
            TextField(
              onTap: (){getEndingPoint(context);},
              controller: endingPoint,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(Icons.location_on,color: Colors.white),
                border: OutlineInputBorder(),
                labelText: 'Choose destination',

                // labelStyle: TextStyle(color: Colors.white)
              ),

            ),
            SizedBox(height: 5,),
            DateTimeField(

              decoration: (
                  InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.calendar_today,color: Colors.white),
                    border: OutlineInputBorder(),
                    hintText: 'Enter the date',

                    // hintStyle: TextStyle(color: Colors.white)
                  )
              ),
              format: format,
              onShowPicker: (context,currentValue) async{
                return await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100)

                );


              },
              controller: date,
            ),

            RaisedButton.icon(

              color: Colors.blue,
              onPressed: (){

                // print(start.text+endPoint.text+date.text);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => TrainDetailsPage(
                          start :startingPoint.text,
                          end: endingPoint.text,
                          date:date.text,
                        )
                    ));
              },
              icon: Icon(Icons.arrow_forward,color: Colors.white ,),
              label: Text('Find',
                style: TextStyle(
                    color: Colors.white
                ),),

            )

          ],
        ),
      ) ,

    ) ;
  }
  void getStartingPoint(BuildContext context) async{
    final String startSelected = await showSearch(
      context:context,
      delegate :DataSearch(),
    );

      if(startSelected !=null){
        startingPoint.text = startSelected;

      }
  }
  void getEndingPoint (BuildContext context)async{
    final String endSelected = await showSearch(
        context: context,
        delegate: DataSearch()
    );
    if(endSelected !=null){
      endingPoint.text=endSelected;
    }
  }
}

//Title widget
class Title extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(

        children: <Widget>[
          Text('EasyTravel',
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue
              )),
          Text(
            'Easiet way to travel across Sri Lanka',
            style: TextStyle(
                color: Colors.white
            ),
          )
        ],
      ),


    );
  }
}

/*
  * Navigating to MyBooking Page
  * Navigating to Profile Page
 */
class MenuItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton.icon(
            onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => MyBookingPage())
              );
            },
            icon: Icon(Icons.history,color: Colors.blue),
            label: Text('MyBooking',
              style: TextStyle(
                fontSize: 30.0,

              ),
            )
        ),
        FlatButton.icon(
            onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(
                      builder: (builder)=>Profile()));
            },
            icon: Icon(Icons.person,color: Colors.blue),
            label: Text(
              'MyProfile',
              style: TextStyle(
                fontSize: 30.0,

              ),
            )
        )

      ],
    );
  }
}
/*
class DataSearch extends SearchDelegate<String>{

  final cities=['Colombo','Galle','Kandy','NuwaraEliya','Jaffna','Wellwatte','Panadura'];


  @override
  List<Widget> buildActions(BuildContext context) {

    return[IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        query = "";
      },)];

  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      icon: AnimatedIcon(

          icon: AnimatedIcons.menu_arrow,

          progress: transitionAnimation),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = cities.where((x)=> x.startsWith(query)).toList();


    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap: (){
        showResults(context);
      },
      leading : Icon(Icons.location_city),
      title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      )),
    ),
      itemCount: suggestionList.length,);
  }

}
*/