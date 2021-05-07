import 'package:adshop/Widgets/custom_button.dart';
import 'package:adshop/Widgets/custom_input.dart';
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
            child: Text(
              "Welcome to\nADShop",
              textAlign: TextAlign.center,
              style: Constants.boldHeading,
            ),
          ),
          Column(
            children: [
              CustomInpt(
                hintText: "Email...",
              ),
              CustomInpt(
                hintText: "Password...",
              ),
              Custombtn(
                text: "Login",
                onPressed: () {
                  print("User clicked login");
                },
                outlineBtn: false,

              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Custombtn(
              text: "Create a new account",
              onPressed: () {
                print("Clicked the create account button");
              },
              outlineBtn: true,
            ),
          ),
        ],
      ),
    )));
  }
}
