import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class Student {
  String StudentName;
  String StudentEmail;
  String StuID;
  String School;
  String Record;
  String Futures;
  String ContactNumber;
  String Knowf;
  String Talent;
  String FatherName;
  String MotherName;
  String AltenateNumber;
  String Gender;
  String UserName;

  Student(
      {this.StudentName,
      this.StudentEmail,
      this.StuID,
      this.School,
      this.Record,
      this.Futures,
      this.ContactNumber,
      this.Talent,
      this.FatherName,
      this.MotherName,
      this.AltenateNumber,
      this.Gender,
      this.UserName,
      this.Knowf});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        StudentName: parsedJson['StudentName'],
        StudentEmail: parsedJson['StudentEmail'],
        StuID: parsedJson['StuID'],
        School: parsedJson['School'],
        Record: parsedJson['Record'],
        Futures: parsedJson['Future'],
        ContactNumber: parsedJson['ContactNumber'],
        Talent: parsedJson['Talent'],
        FatherName: parsedJson['FatherName'],
        MotherName: parsedJson['MotherName'],
        AltenateNumber: parsedJson[' AltenateNumbe'],
        Gender: parsedJson['Gender'],
        UserName: parsedJson['UserName'],
        Knowf: parsedJson['Knowf']);
  }
}

Future<Student> loadStudent() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String ID = preferences.getString('ID');
  var _url =
'https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/profile.php';
  final jsonString = await http.post(Uri.parse(_url), body: {"id": ID});
  print(jsonString.body);
  var jsonResponse = json.decode(jsonString.body);
  return new Student.fromJson(jsonResponse);
}

final _formKey = GlobalKey<FormState>();

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: FutureBuilder(
          future: loadStudent(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(color: Colors.lightBlue.shade900),
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          TextFormField(
                            initialValue: "${snapshot.data.Talent}",
                            decoration: InputDecoration(
                              labelText: "ความสามารถพิเศษ",
                            ),
                          ),
                          TextFormField(
                            initialValue: "${snapshot.data.FatherName}",
                            decoration: InputDecoration(
                              labelText: "วิชาเรียน",
                            ),
                          ),
                          TextFormField(
                            initialValue: "${snapshot.data.MotherName}",
                            decoration: InputDecoration(
                              labelText: "กีฬา",
                            ),
                          ),
                          TextFormField(
                            initialValue: "${snapshot.data.Gender}",
                            decoration: InputDecoration(
                              labelText: "กิจกรรม",
                            ),
                          ),
                          TextFormField(
                            initialValue: "${snapshot.data.UserName}",
                            decoration: InputDecoration(
                              labelText: "โปรแกรม",
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.save),
                        label: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
