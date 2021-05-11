import 'package:adshop/Services/Firebase_services.dart';
import 'package:adshop/Widgets/bottomtabs.dart';
import 'package:adshop/tabs/hometab.dart';
import 'package:adshop/tabs/profiletab.dart';
import 'package:adshop/tabs/savedtab.dart';
import 'package:adshop/tabs/searchtab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseServices _firebaseServices = FirebaseServices();
  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    print("User ID: ${_firebaseServices.getUserId()}");
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
              HomeTab(),
              Searchtab(),
              Savedtab(),
              Profiletab(),
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
