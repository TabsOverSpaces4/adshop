import 'package:adshop/Widgets/custom_action_bar.dart';
import 'package:flutter/material.dart';

class Savedtab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Text("Saved Tab"),),
          CustomActionBar(
            hasBackArrow: false,
            title: "Saved",
          ),
        ],
      ),
      
    );
  }
}