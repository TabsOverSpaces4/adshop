import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Text("Home Tab"),),
          Container(
            child: Text("Action Bar"),
          )
        ],
      ),
      
    );
  }
}