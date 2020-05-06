import 'package:flutter/material.dart';

import 'home.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_style_top.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.35,
            right: MediaQuery.of(context).size.width / 3.4,
            child: Text(
              'COURSE',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 38),
            ),
          ),
//          Center(
//            child: Stack(
//              children: <Widget>[
//                Container(
//                  height: MediaQuery.of(context).size.width/2,
//                  width: MediaQuery.of(context).size.width/2,
//                  color: Colors.white,
//                ),
//                Image.asset("assets/images/img_study_test.png", height: 100, width: 100, scale: 1.0,),
//              ],
//            ),
//          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * 0.9,
            left: MediaQuery.of(context).size.width * 0.4,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Text(
                    'HOME',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
