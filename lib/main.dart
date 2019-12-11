import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'dart:convert';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
);

class MyApp extends StatefulWidget{
  final url = 'https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/master/assets/student.json';

  createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  String _appBarTitle = 'Requesting JSON';
  String _url;
  Student _student = Student();

  initState() {
    _url = widget.url;
    super.initState();
    _sendRequest();
  }

  _sendRequest() {
    http.get(_url).then((response) {
      print(response.body);
      final jsonMap = json.decode(response.body);
      _student = Student.fromJson(jsonMap);
      setState(() {});
    }).catchError((error) {
      print(error.toString());
      _appBarTitle = error.toString();
      setState(() {});
    });
  }
  
  build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(_appBarTitle),),
    body: Center(
      child: Column(
        children: [
          Text(_student.id == null ? "" : _student.id),
          Text(_student.name == null ? "" : _student.name),
          Text(_student.scores.toString() == null ? "" : _student.scores.toString()),

        ],
      ),
    ),
  );
}