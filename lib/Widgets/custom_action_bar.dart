import 'package:adshop/constants.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  CustomActionBar({this.title, this.hasBackArrow, this.hasTitle});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      padding: EdgeInsets.only(
        top: 56.0,
        bottom: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(8.0)),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("lib/Assets/images/back_arrow.png"),
                color: Colors.black,
                width: 16,
                height: 16,
              ),
            ),
            if(_hasTitle)
              Text(
                title ?? "Action Bar",
                style: Constants.boldHeading,
              ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: Colors.deepOrange[700],
                borderRadius: BorderRadius.circular(8.0)),
            alignment: Alignment.center,
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
