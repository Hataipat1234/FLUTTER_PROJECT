import 'package:flutter/material.dart';
import 'package:ui_tut/APP1/Edit.dart';
import 'package:ui_tut/APP1/Favorite.dart';
import 'package:ui_tut/APP1/NewsPage/Favorites.dart';

import 'package:ui_tut/Homegride.dart';
import '../Login/login_page.dart';
import 'Newspage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        actions: [],
      ),
      body: Container(
        color: Colors.lightBlue.shade900,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.width - 64) / 2,
                  width: double.infinity,
                  child: Image.network(
                    'https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/250788927_4827593740624855_8169351238785660921_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeHOCCNKz2PghRZa13sjVrVhgobvDtWXz4-Chu8O1ZfPjxfnyDg44eLFnFYQKFmjHf4dL2bvg5NoK5lR9PKzqZ7S&_nc_ohc=5OXAxPYU5bIAX-m37CV&_nc_ht=scontent.fbkk28-1.fna&oh=00_AT8rBKx2ZH4OOdJe0wlaBaD__B6yzw1Lz5GOF61STwf-fA&oe=6221B463',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[300]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.new_label,
                                size: 50, color: Colors.white),
                            Text(
                              'News',
                              style:
                                  TextStyle(color: Colors.white, 
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeGride()
                                ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[300]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.perm_contact_cal_sharp,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'My Profile',
                              style:
                                  TextStyle(color: Colors.white, 
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favorites()
                                ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[300]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.new_label,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Favorite',
                              style:
                                  TextStyle(color: Colors.white, 
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Version()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[300]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_location_alt,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Version',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
