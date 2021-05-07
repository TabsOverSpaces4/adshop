import 'package:flutter/material.dart';

class Custombtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  Custombtn({this.text, this.onPressed, this.outlineBtn});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false; 

    return GestureDetector(
      onTap: onPressed,
          child: Container(
        height: 65.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.black,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: Text(
          text ?? "Text",
          style: TextStyle(
            fontSize: 16.0,
            color: _outlineBtn ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
