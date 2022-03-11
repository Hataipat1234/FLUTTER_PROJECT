/*import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/modune/form_model.dart';
import 'package:ui_tut/APP1/modune/my_form_text_field.dart';
import 'modune/models/form_model.dart';
import 'dart:async' show Future;



class  Favorite extends StatefulWidget {
  @override
  _State createState() => _State();
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
  }}

class _State extends State<> {
  
  @override
  Widget build(BuildContext context) {
    Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Container(
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
                              initialValue: "${snapshot.data.StudentName}",
                              decoration: InputDecoration(
                                labelText: "ความสามารถพิเศษ",
                              ),
                    ),
                   TextFormField(
                              initialValue: "${snapshot.data.StudentName}",
                              decoration: InputDecoration(
                                labelText: "วิชาเรียน",
                        ),
                        ),
                     TextFormField(
                              initialValue: "${snapshot.data.StudentName}",
                              decoration: InputDecoration(
                                labelText: "กีฬา",
                      ),
                    ),
                      TextFormField(
                              initialValue: "${snapshot.data.StudentName}",
                              decoration: InputDecoration(
                                labelText: "กิจกรรม",
                      ),
                    ),
                     TextFormField(
                              initialValue: "${snapshot.data.StudentName}",
                              decoration: InputDecoration(
                                labelText: "โปรแกรม",
                      ),
                    ),
                    
                  ]),
                ),
                 FloatingActionButton.extended(
                            onPressed: () {},
                            icon: Icon(Icons.save),
                            label: Text("Save"),
                          ),
              ],
            ),
          )),
    );
  }
}






   // var result = await jsonDecode(response.body);
   // if (result["status"] == "error") {
   // } else {}
   
 // }

  //final _formKey = GlobalKey<FormState>();


 */
