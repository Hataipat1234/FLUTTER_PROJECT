import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/modune/models/form_model.dart';
import 'package:ui_tut/APP1/modune/my_form_text_field.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

final _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// uniquely identifies a Form
final _formKey = GlobalKey<FormState>();

// holds the form data for access
final model = FormModel();

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                        child: Column(
                          children: <Widget>[
                            MyFormTextField(
                              isObscure: false,
                              decoration: InputDecoration(
                                labelText: "รหัสนักศึกษา",
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "ชื่อ-สกุล",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "โรงเรียน",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "บันทึก",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "รู้ข่าวสารจาก",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "อนาคต",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              ),
                            ),
                            Form(
                              child: MyFormTextField(
                                isObscure: false,
                                decoration: InputDecoration(
                                  labelText: "เลขบัญชีธนาคาร",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
