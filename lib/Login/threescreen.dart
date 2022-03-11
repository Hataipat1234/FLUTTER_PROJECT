import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/HomePage.dart';
import 'package:ui_tut/AppBottomBar.dart';
import 'package:ui_tut/Homegride.dart';
import 'package:ui_tut/Login/resetpassword.dart';
import 'package:ui_tut/Login/threescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:developer';

class ThreeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen> {
  String email;
  String password;
  String conpassword;

  get formKey => null;

  Future<String> registerBtn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   var _url =
'https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/register.php';

    final response = await http
        .post(Uri.parse(_url), body: {"email": email, "password": password});
    preferences.setString('email', email);
    var result = await jsonDecode(response.body);
    //final prefs = await SharedPreferences.getInstance();
    // print(response);
    if (result[0]["status"] == "error") {
    } else {
      preferences.setString('ID', result[0]["ID"]);
      preferences.setString('StudentClass', result[0]["StudentClass"]);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppBottomBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade900,
      body: new Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: new Column(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          "Create Account ",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "(Computer Engineering)",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 5))
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    padding: EdgeInsets.all(20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: new Form(
                                      key: formKey,
                                      child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          new TextFormField(
                                            decoration: new InputDecoration(
                                              hintText: "Email ",
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              prefixIcon: Icon(
                                                Icons.people,
                                                color: Colors.amber,
                                                size: 25,
                                              ),
                                            ),
                                            onChanged: (String value) =>
                                                email = value,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: new Form(
                                      key: formKey,
                                      child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            new TextFormField(
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: "Password",
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                prefixIcon: Icon(
                                                  Icons.lock,
                                                  color: Colors.amber,
                                                  size: 25,
                                                ),
                                              ),
                                              onChanged: (String value) =>
                                                  password = value,
                                            ),
                                          ]),
                                    ),
                                  ),
                         Padding(
                           padding: EdgeInsets.symmetric(
                         vertical: 5, horizontal: 30),
                            child: new Form(
                            key: formKey,
                              child: new Column(
                                crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                         children: <Widget>[
                               new TextFormField(
                               obscureText: true,
                          decoration: InputDecoration(
                          hintText: " ConfirmPassword",
                           floatingLabelBehavior:
                            FloatingLabelBehavior
                             .always,
                           border: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.circular(
                           10)),
                           prefixIcon: Icon(
                           Icons.password,
                           color: Colors.amber,
                            size: 25,
                            ),
                            ),
                            onChanged: (String value) =>
                            conpassword = value,
                                            ),
                                            ListTile(
                                              title: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: RaisedButton(
                                                      child: Text(
                                                          "Create Account"),
                                                      color:
                                                          Colors.blue.shade900,
                                                      textColor: Colors.white,
                                                      onPressed: registerBtn,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ]),
          ]),
        ),
      ),
    );
  }
}

class HomGride {}
