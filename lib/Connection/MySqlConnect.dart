import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future getConnection() async{
  final conn=await MySqlConnection.connect(
    new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user:'root',
      db:  'flutter_database'
    )
  );
  //Insert data
  var result = await conn.query(
      'INSERT INTO users(userName,userEmail,userPassword) values(?,?,?)'
  );
}