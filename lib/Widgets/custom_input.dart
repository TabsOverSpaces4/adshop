import 'package:adshop/constants.dart';
import 'package:flutter/material.dart';

class CustomInpt extends StatelessWidget {
  final String hintText;
  CustomInpt({this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "hint Text",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 24.0,
            )),
        style: Constants.regularDarkText,
      ),
    );
  }
}
