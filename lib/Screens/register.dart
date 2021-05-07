import 'package:adshop/Widgets/custom_button.dart';
import 'package:adshop/Widgets/custom_input.dart';
import 'package:adshop/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

//build an alert dialog to display an error
class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error!"),
            content: Container(
              child: Text("Random text error"),
            ),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

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
              "Create A New Account",
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
                text: "Create Account",
                onPressed: () {
                  _alertDialogBuilder();
                },
                outlineBtn: false,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Custombtn(
              text: "Back To Login",
              onPressed: () {
                Navigator.pop(context);
              },
              outlineBtn: true,
            ),
          ),
        ],
      ),
    )));
  }
}
