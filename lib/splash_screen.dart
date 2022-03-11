import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String _email;
  String _password;
  get formKey => null;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff002fff),
            Color(0xff00f4ff),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            alignment: Alignment.center,
            height: size.height / 10,
            width: size.width / 1.00,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/calendar.png')),
            ),
          ),
        ],
      ),
    ));
  }
}
