import 'package:adshop/Screens/contacted.dart';
import 'package:adshop/constants.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar({
    this.title,
    this.hasBackArrow,
    this.hasTitle,
    this.hasBackground,
  });

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1))
              : null),
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
            ),
          if (_hasTitle)
            Text(
              title ?? "Action Bar Title",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactedPage(),
                      ));
                },
                      child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[700],
                    borderRadius: BorderRadius.circular(8.0)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.recent_actors_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
