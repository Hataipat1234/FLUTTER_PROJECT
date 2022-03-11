import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'APP1/modune/models/form_model.dart';
import 'APP1/modune/my_form_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeGride extends StatefulWidget {
  @override
  _HomeGrideState createState() => _HomeGrideState();
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

  Student(
      {this.StudentName,
      this.StudentEmail,
      this.StuID,
      this.School,
      this.Record,
      this.Futures,
      this.ContactNumber,
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
        Knowf: parsedJson['Knowf']);
  }
}

Future<Student> loadStudent() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String ID = preferences.getString('ID');
  var _url =
 'https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/profile.php';
  final jsonString = await http.post(Uri.parse(_url), body: {"id": ID});
  print(jsonString.body); //////แสดงค่าที่รับจากเซอร์วิส
  var jsonResponse = json.decode(jsonString.body);
  return new Student.fromJson(jsonResponse);
}

class _HomeGrideState extends State<HomeGride> {
  // uniquely identifies a Form
  String StudentName;
  String StudentEmail;
  String StuID;
  String School;
  String Record;
  String Futures;
  String ContactNumber;
  String Knowf;

  Future<String> updateBtn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
 var _url ='https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/updateprofile.php';
    final response = await http.post(Uri.parse(_url), body: {
      "StudentName": StudentName,
      "StudentEmail": StudentEmail,
      "StuID": StuID,
      "School": School,
      "Record": Record,
      "Futures": Futures,
      "ContactNumber": ContactNumber,
      "Knowf": Knowf,
    });

    var result = await jsonDecode(response.body);
    if (result["status"] == "error") {
    } else {
      print(result.body);
    }
  }

  final _formKey = GlobalKey<FormState>();

  Widget futureWidget() {
    return new FutureBuilder<Student>(
      future: loadStudent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.StudentName);
          return new Container(
            child: Column(children: <Widget>[
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Center(),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  decoration: BoxDecoration(color: Colors.black),
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                initialValue: "${snapshot.data.StuID}",
                                decoration: InputDecoration(
                                  labelText: "รหัสนักศึกษา  CODE ID",
                                ),
                                onFieldSubmitted: (String value) =>
                                    StuID = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.StudentName}",
                                decoration: InputDecoration(
                                  labelText: "ชื่อ-สกุล",
                                ),
                                onFieldSubmitted: (String value) =>
                                    StudentName = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.School}",
                                decoration: InputDecoration(
                                  labelText: "โรงเรียน",
                                ),
                                onFieldSubmitted: (String value) =>
                                    School = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.Record}",
                                decoration: InputDecoration(
                                  labelText: "บันทึก",
                                ),
                                onFieldSubmitted: (String value) =>
                                    Record = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.Knowf}",
                                decoration: InputDecoration(
                                  labelText: "รู้ข่าวสารจาก",
                                ),
                                onFieldSubmitted: (String value) =>
                                    Knowf = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.Futures}",
                                decoration: InputDecoration(
                                  labelText: "อนาคต",
                                ),
                                onFieldSubmitted: (String value) =>
                                    Futures = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.StudentEmail}",
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                                onFieldSubmitted: (String value) =>
                                    StudentEmail = value,
                              ),
                              TextFormField(
                                initialValue: "${snapshot.data.ContactNumber}",
                                decoration: InputDecoration(
                                  labelText: "หมายเลขติดต่อ",
                                ),
                                onFieldSubmitted: (String value) =>
                                    ContactNumber = value,
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
                      ])),
                ),
              ),
            ]),
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  // holds the form data for access
  final model = FormModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      appBar: AppBar(
        title: Text('Myprofile'),
      ),
      body: SingleChildScrollView(child: futureWidget()),
    );
  }
}
