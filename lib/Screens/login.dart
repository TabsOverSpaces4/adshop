import 'package:adshop/constants.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        "Login Page",
        style: Constants.regularHeading,
      ),),
    );
  }
}