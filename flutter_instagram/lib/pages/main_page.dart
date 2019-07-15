import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'widgets/navbar.dart';
import 'widgets/navbar_enum.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  CustomNavBarItem currentItemSelected = CustomNavBarItem.Home;

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;
    switch (currentItemSelected) {
      case CustomNavBarItem.Home:
        selectedPage = HomePage();
        break;
      case CustomNavBarItem.Search:
        selectedPage = Container(color: Colors.grey,);
        break;
      case CustomNavBarItem.Add:
        selectedPage = Container(color: Colors.blue,);
        break;
      case CustomNavBarItem.Notifications:
        selectedPage = Container(color: Colors.green,);
        break;
      case CustomNavBarItem.Profile:
        selectedPage = Container(color: Colors.red,);
        break;
    }
    return Material(
      child: SizedBox.expand(
        child: Column(
          children: <Widget>[
            Expanded(
              child: selectedPage,
            ),
            CustomNavBar(
              onTap: (item) {
                setState(() {
                  currentItemSelected = item;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
