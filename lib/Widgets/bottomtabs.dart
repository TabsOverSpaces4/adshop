import 'package:flutter/material.dart';

class Btmtabs extends StatefulWidget {
  final int selectedTab;
  Btmtabs({this.selectedTab});

  @override
  _BtmtabsState createState() => _BtmtabsState();
}

class _BtmtabsState extends State<Btmtabs> {
  int _selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
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
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                setState(() {
                  _selectedTab = 0;
                });
              },
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_search.png",
              selected: _selectedTab == 1 ? true : false,
              onPressed: () {
                setState(() {
                  _selectedTab = 1;
                });
              },
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_saved.png",
              selected: _selectedTab == 2 ? true : false,
              onPressed: () {
                setState(() {
                  _selectedTab = 2;
                });
              },
            ),
            BtmtabBtn(
              imagePath: "lib/Assets/images/tab_logout.png",
              selected: _selectedTab == 3 ? true : false,
              onPressed: () {
                setState(() {
                  _selectedTab = 3;
                });
              },
            ),
          ],
        ));
  }
}

class BtmtabBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  BtmtabBtn({this.imagePath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected ? Theme.of(context).accentColor : Colors.transparent,
          width: 2.0,
        ))),
        child: Image(
          image: AssetImage(imagePath ?? "lib/Assets/images/tab_home.png"),
          width: 26.0,
          height: 26.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
