import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/HomePage.dart';
import 'package:ui_tut/APP1/NewsPage/Version.dart';
import 'package:ui_tut/Login/login_page.dart';
import 'package:ui_tut/Login/threescreen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.settings),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  onTap: () {
                    print('You Click ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: ListTile(
        leading: Icon(Icons.logout),
        title: Text('Log out'),
        onTap: () {
          print('You Click ');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }),
          );
        },
      ),
    );
  }
}
