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
      body: SafeArea(
        child: Container(
          width: double.infinity,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            padding: EdgeInsets.only(
              top: 24.0,
            ),
            child: Text("Welcome to\nADShop",
            textAlign: TextAlign.center,
            style: Constants.boldHeading,
            ),
          ),
          Text("Input fields"),
          Text("Create account button")
        ],),
      )
    ));
  }
}