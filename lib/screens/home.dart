import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Project%20Flutter/FujiyamaMobileApp/fujiyama/lib/screens/play_screen.dart';
import 'file:///E:/Project%20Flutter/FujiyamaMobileApp/fujiyama/lib/screens/status_screen.dart';
import 'package:fujiyama/services/auth.dart';

import 'course_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//        actions: <Widget>[
//          FlatButton.icon(
//              onPressed: () async {
//                await _auth.signOut();
//              },
//              icon: Icon(
//                Icons.person,
//                color: Colors.white,
//              ),
//              label: Text(
//                'Logout',
//                style: TextStyle(color: Colors.white),
//              ))
//        ],
//      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/main_background1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseScreen()));
                              },
                              child: _myStyle(
                                  context, "COURSE", Colors.red, Colors.red)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StatusScreen()));
                              },
                              child: _myStyle(context, "STATUS", Colors.brown,
                                  Colors.brown)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlayScreen()));
                              },
                              child: _myStyle(
                                  context, "Play", Colors.red, Colors.red)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _myStyle(BuildContext context, String text, Color color1, Color color2) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color1,
        ),
      ),
      Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height / 8.5,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ],
  );
}
