import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/Edit.dart';
import 'package:ui_tut/APP1/HomePage.dart';
import 'package:ui_tut/Homegride.dart';
import 'package:ui_tut/Login/SettingPage.dart';
import 'package:ui_tut/Login/login_page.dart';
import 'package:ui_tut/test.dart';

class AppBottomBar extends StatefulWidget {
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int inx = 0;
  final HomeScreen = [
    HomePage(),
    HomeGride(),
    // HomGride(),
    SettingPage(),
  ];

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: HomeScreen[inx]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: inx,
        onTap: (index) {
          if (index != 2) {
            setState(() => inx = index);
            return;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
