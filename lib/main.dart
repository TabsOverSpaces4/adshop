import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landingpage(),
    );
  }
}

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
          return Scaffold(
            body: Container(
                child: Center(
              child: Text("Firebase app initialized"),
            )),
          );
        }
//inroute initialization
        return Scaffold(
          body: Container(
              child: Center(
            child: Text("Initializing app"),
          )),
        );
      },
    );
  }
}
