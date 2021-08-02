import 'package:brewcrew/screens/authenticate/authenticate.dart';
import 'package:brewcrew/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
    return Authenticate();
  }
}
