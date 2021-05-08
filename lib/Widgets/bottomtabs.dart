import 'package:flutter/material.dart';

class Btmtabs extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1.0,
                blurRadius: 40.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_home.png",
              selected: true,
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_search.png",
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_saved.png",
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_logout.png",
            ),
          ],
        ));
  }
}

class BtmtabBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  BtmtabBtn({this.imagePath, this.selected});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 28.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: _selected ? Theme.of(context).accentColor : Colors.transparent,
            width: 2.0,
          )
        )
      ),
      child: Image(
        image: AssetImage(imagePath ?? "lib/Assets/images/tab_home.png"),
        width: 26.0,
        height: 26.0,
        color: _selected ? Theme.of(context).accentColor : Colors.black,
      ),
    );
  }
}
