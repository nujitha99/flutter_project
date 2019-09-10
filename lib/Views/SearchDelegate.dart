// Author - N.W.R.Amasha
////created Date - 5/8/2019
////TITLE - Search Delegate

//Shows the train stations in Sri Lanka.

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{

  final cities=['Colombo Fort','Maradana','Dematagoda','Kelaniya','Ragama','Ganemulla','Gampaha','Veyangoa','Ganegoda','Pallewela','Galle','Kandy','NuwaraEliya','Jaffna','Wellwatte','Panadura'];


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
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = cities.where((x)=> x.startsWith(query)).toList();


    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap: (){
        close(context, suggestionList[index]);
      },
      leading : Icon(Icons.location_city),
      title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
          children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      )),
    ),
      itemCount: suggestionList.length,);
  }

}



