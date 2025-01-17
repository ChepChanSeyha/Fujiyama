import 'package:flutter/material.dart';
import 'package:fujiyama/authenticate/authenticate.dart';
import 'package:fujiyama/models/user.dart';
import 'package:provider/provider.dart';
import '../screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
