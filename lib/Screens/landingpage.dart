import 'package:adshop/Screens/home.dart';
import 'package:adshop/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {

//not connected successfully 

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
//Connection made with firebase
        if (snapshot.connectionState == ConnectionState.done) {
          return Homepage();
        }
//inroute initialization
        return Scaffold(
          body: Container(
              child: Center(
            child: Text("Initializing app", style: Constants.regularHeading,),
          )),
        );
      },
    );
  }
}
