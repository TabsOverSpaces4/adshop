import 'package:adshop/Widgets/bottomtabs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Expanded(
          child: PageView(
            controller: _tabsPageController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              Container(
                child: Center(child: Text("Homepage")),
              ),
              Container(
                child: Center(child: Text("Search Page")),
              ),
              Container(
                child: Center(child: Text("Saved Page")),
              ),
              Container(
                child: Center(child: Text("Profile Page")),
              )
            ],
          ),
        )),
        Btmtabs(
          selectedTab: _selectedTab,
          tabPressed: (num) {
            setState(() {
              _tabsPageController.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            });
          },
        ),
      ],
    ));
  }
}
