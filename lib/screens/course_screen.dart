import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/screens/course.dart';
import 'package:fujiyama/screens/home.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
          Positioned(
            height: MediaQuery.of(context).size.height * 0.58,
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * 0.3,
            child: StreamBuilder(
              stream: Firestore.instance.collection('course').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: Text("Loading..."));
                return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return _customTextField(
                          context, snapshot.data.documents[index]);
                    });
              },
            ),
          ),
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

Widget _customTextField(BuildContext context, DocumentSnapshot document) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Course()));
    },
    child: Card(
      child: ListTile(
        title: Text(document["title"]),
        subtitle: Text(document["description"]),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
}
