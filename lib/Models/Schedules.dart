import 'dart:convert';

import 'package:http/http.dart' as http;
class Schedules{


  Future<dynamic> fetchData(String start,String end) async{
       //final String date;


  //  print('in');
    List data = new List() ;
    String journey;
    List journeydestinations;
    String time;
   List journeyTime;
    String startTime;
    String endTime;
    String trainId;
    String trainName;
    String trainClass;
    List trainDetails = new List();
    List lst;

   // print('in2');
    final response = await http.get('http://10.0.2.2/admin_TrainApp/searchdata.php');
    data = json.decode(response.body);


    for(int i=0;i< data.length;i++){
      journey =data[i]['journeyDestinations'];
     // print(data[1]['journeyDestinations']);
      //print(data[1]);
     time =  data[i]['journeyTime'];

      //print(journey);
      //print(journey.split(','));
      journeydestinations =journey.split(',');
      journeyTime = time.split(',');

      for(int k=0;k<journeydestinations.length;k++){

        if(journeydestinations[k]==start){
          int num= k;
          startTime = journeyTime[k];
          //print(startTime);
          for(int j=num;j<journeydestinations.length;j++){

            print(journeydestinations[j]);
            if(journeydestinations[j]== end){

              endTime = journeyTime[j];
              trainId = data[i]['trainId'];
              trainName = data[i]['trainName'];


                lst=[startTime,endTime,trainId,trainName];
              trainDetails.add(lst);
            }
          }
        }

      }

      print(trainDetails);

    }
    return trainDetails;
    //print('out');

  }

  Future<List> fetchSeatsData() async{
    List conn =[];
    final response = await http.get('http://Fermentative-absenc.000webhostapp.com/searchdata.php');
    conn = json.decode(response.body);


  }
}

