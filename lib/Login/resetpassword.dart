import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/HomePage.dart';
import 'package:ui_tut/AppBottomBar.dart';
import 'package:ui_tut/Login/login_page.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  String _email;
  String _password;

  get formKey => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 300,
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
                                      vertical: 5, horizontal: 30
                                      ),
                                  child: new Form(
                                    key: formKey,
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        new TextFormField(
                                          decoration: new InputDecoration(
                                            labelText: 'NewPassword',
                                            hintText: "Enter Password ",
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            prefixIcon: Icon(
                                              Icons.password,
                                              color: Colors.amber,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30
                                      ),
                                  child: new Form(
                                    key: formKey,
                                    child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          new TextFormField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Confirm New Password ',
                                              hintText: "Confirm Password ",
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20
                                                ),
                                                ),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Colors.amber,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          child: Text("Reset"),
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AppBottomBar()
                                                ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ]),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
