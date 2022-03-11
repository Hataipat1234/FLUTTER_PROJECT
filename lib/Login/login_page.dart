import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_tut/APP1/HomePage.dart';
import 'package:ui_tut/AppBottomBar.dart';
import 'package:ui_tut/Homegride.dart';
import 'package:ui_tut/Login/json/api.dart';
import 'package:ui_tut/Login/resetpassword.dart';
import 'package:ui_tut/Login/threescreen.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import './json/env.dart';

class Name {
  final String Message;
  const Name({
    this.Message,
  });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  toJson() {}

  static Future<LoginPage> fromJson(decode) {}
}

class _LoginPageState extends State<LoginPage> {
  get e => null;

  String usr = "", pwd = "";
  Map<dynamic, dynamic> response;

  Future<String> loginBtn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Map<String, String> $_POST = {"username": usr, "password": pwd};
    var _url =
        'https://web.rmutp.ac.th/eng/chaichalerm-s/rmutp.ms/studentms/api/login.php';

    final response =
        await http.post(Uri.parse(_url), body: {"email": usr, "password": pwd});
    preferences.setString('username', usr);
    print(response.body);
    var result = await jsonDecode(response.body);

    if (result["status"] == "error") {
      await _showMyDialog(context);
    } else {
      preferences.setString('ID', result["ID"]);
      preferences.setString('StudentClass', result["StudentClass"]);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppBottomBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade900,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
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
                      "WELCOME",
                      style: TextStyle(
                          fontSize: 50,
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
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      new TextFormField(
                                        decoration: new InputDecoration(
                                          hintText: "Username",
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.amber,
                                            size: 25,
                                          ),
                                        ),
                                        onChanged: (String value) =>
                                            usr = value,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: new Form(
                                  child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        new TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.amber,
                                              size: 25,
                                            ),
                                          ),
                                          onChanged: (String value) =>
                                              pwd = value,
                                        ),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: RaisedButton(
                                      child: Text("Login"),
                                      color: Colors.blue.shade900,
                                      textColor: Colors.white,
                                      onPressed: loginBtn,
                                    )),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ThreeScreen()));
                                      },
                                      child: Text(
                                        'Create Account',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      color: Colors.black,
                                      textColor: Colors.white,
                                    )),
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResetPassword()));
                                        },
                                        child: Text(
                                          'Reset Password',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        color: Colors.black,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class FlutterSession {
  set(String s, result) {}
}

Future<void> _showMyDialog(context) => showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('ชื่อผู้ใช้/รหัสผ่านผิด!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
