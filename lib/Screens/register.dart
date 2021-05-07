import 'package:adshop/Widgets/custom_button.dart';
import 'package:adshop/Widgets/custom_input.dart';
import 'package:adshop/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

//build an alert dialog to display an error
class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error!"),
            content: Container(
              child: Text(error),
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

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _registerformLoading = true;
    });

    String _createAccountFeedback = await _createAccount();
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      setState(() {
        _registerformLoading = false;
      });
    } else {
      //Sign in was successful and the user was routed towards the homescreen using pop funciton
      Navigator.pop(context);
    }
  }

  // Create a new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //Default Form Loading State
  bool _registerformLoading = false;

  //Form input field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for the input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
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
                onChanged: (value) {
                  _registerEmail = value;
                },
                onSubmitted: (value) {
                  _passwordFocusNode.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInpt(
                hintText: "Password...",
                onChanged: (value) {
                  _registerPassword = value;
                },
                focusNode: _passwordFocusNode,
                isPasswordField: true,
                onSubmitted: (value) {
                  _submitForm();
                },
              ),
              Custombtn(
                text: "Create Account",
                onPressed: () {
                  _submitForm();
                },
                outlineBtn: false,
                isLoading: _registerformLoading,
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
