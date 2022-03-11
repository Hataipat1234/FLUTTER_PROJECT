import 'package:flutter/material.dart';
import 'package:ui_tut/Login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue.shade900,
      ),
      home: LoginPage(),
    );
  }
}
