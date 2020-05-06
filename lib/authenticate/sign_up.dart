import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/screens/home.dart';
import 'package:fujiyama/shared/loading.dart';
import 'package:fujiyama/shared/widget.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  TextEditingController userNameInputController;
  TextEditingController phoneInputController;
  TextEditingController dobInputController;
  TextEditingController genderInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    userNameInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    dobInputController = new TextEditingController();
    genderInputController = new TextEditingController();
    super.initState();
  }

  bool _obscureText = true;
  bool loading = false;
  String error = '';
  List<String> _gender = <String>['Male', 'Female'];
  var selectedGender;
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formatDate = DateFormat.yMMMd().format(_dateTime);
    return loading
        ? Loading()
        : Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 1,
              child: Image.asset(
                "assets/images/bg_style_top.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Text(
                'START',
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 5.0, left: 5.0),
                    child: Image.asset(
                      'assets/images/status_bg_white.png',
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.width * 1.17,
                      color: Colors.white.withOpacity(0.7),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05),
                      child: Form(
                          key: _formKey,
//                                autovalidate: true,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: MediaQuery.of(context).size.width*0.13,
                                  width: MediaQuery.of(context).size.width*0.85,
                                  color: Colors.white,
                                  child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your email'
                                        : null,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                        EdgeInsets.all(10),
                                        hintText: "Email"),
                                    controller: emailInputController,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width*0.02,
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.width*0.13,
                                      width: MediaQuery.of(context).size.width*0.85,
                                      color: Colors.white,
                                      child: TextFormField(
                                        validator: (val) => val.length < 6
                                            ? 'Password must more than 6 characters'
                                            : null,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          contentPadding:
                                          EdgeInsets.all(10),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureText =
                                                !_obscureText;
                                              });
                                            },
                                            child: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              semanticLabel: _obscureText
                                                  ? 'show password'
                                                  : 'hide password',
                                            ),
                                          ),
                                        ),
                                        controller:
                                        passwordInputController,
                                        obscureText: _obscureText,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width*0.02,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.13,
                                  width: MediaQuery.of(context).size.width*0.85,
                                  color: Colors.white,
                                  child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your your user name'
                                        : null,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Full Name",
                                        contentPadding:
                                        EdgeInsets.all(10)),
                                    controller: userNameInputController,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width*0.02,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.13,
                                  width: MediaQuery.of(context).size.width*0.85,
                                  color: Colors.white,
                                  child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your phone number'
                                        : null,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                        EdgeInsets.all(10),
                                        hintText: "Phone Number"),
                                    controller: phoneInputController,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width*0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: MediaQuery.of(context).size.width*0.13,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.35,
                                        color: Colors.white,
                                        child: FlatButton(
                                            onPressed: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                  _dateTime,
                                                  firstDate:
                                                  DateTime(1990),
                                                  lastDate:
                                                  DateTime(2021))
                                                  .then((date) {
                                                setState(() {
                                                  _dateTime = date;
                                                });
                                              });
                                            },
                                            child: Text("$formatDate", style: TextStyle(color: Colors.grey[600], fontSize: 15),))),
                                    SizedBox(
                                      width: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.05,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.width*0.13,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.35,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            items: _gender
                                                .map((value) =>
                                                DropdownMenuItem(
                                                  child: Text(value),
                                                  value: value,
                                                ))
                                                .toList(),
                                            onChanged: (selectedItemGender) {
                                              setState(() {
                                                selectedGender = selectedItemGender;
                                              });
                                            },
                                            value: selectedGender,
                                            iconSize: 0,
                                            hint: Text(
                                              'Gender',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width*0.05,
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.only(
                                      left: 0.0, right: 0.0),
                                  child: customBtn(context, 'CREATE',
                                      Colors.red, Colors.white),
                                  onPressed: () async {
                                    if (_formKey.currentState
                                        .validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                          email: emailInputController
                                              .text,
                                          password:
                                          passwordInputController
                                              .text)
                                          .then((currentUser) => Firestore
                                          .instance
                                          .collection("users")
                                          .document(currentUser
                                          .user.uid)
                                          .setData({
                                        "userID":
                                        currentUser.user.uid,
                                        "userEmail": currentUser
                                            .user.email,
                                        "userPassword":
                                        passwordInputController
                                            .text,
                                        "userName":
                                        userNameInputController
                                            .text,
                                        "userPhone":
                                        phoneInputController
                                            .text,
                                        "userDateOfBirth":
                                        "$formatDate",
                                        "userGender":
                                        "$selectedGender",
                                      }).then(
                                            (result) => Navigator
                                            .pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                    Home()),
                                                (_) => false),
                                      ))
                                          .catchError((err) => print(err))
                                          .catchError(
                                              (err) => print(err));
                                      if (result == null) {
                                        setState(() {
                                          error = 'Something went wrong';
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.only(
                                      left: 0.0, right: 0.0),
                                  child: customBtn(context, 'BACK',
                                      Colors.red, Colors.white),
                                  onPressed: () async {
                                    widget.toggleView();
                                  },
                                ),
                              ],
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
