import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppHomepage extends StatefulWidget {
  @override
  _AppHomepageState createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  int _selectedDestinationTypeIndex = 0;
  int _selectedBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: _body(),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
            child: Text(
              "What you would like to find?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          _destinationCarrousel(),
          _topDestinationsHeader(),
          _topDestinationsContent(),
        ],
      ),
    );
  }

  _destinationCarrousel() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _destinationType(Icons.airplanemode_active, () {
          setState(() {
            _selectedDestinationTypeIndex = 0;
          });
        }, _selectedDestinationTypeIndex == 0),
        _destinationType(Icons.directions_car, () {
          setState(() {
            _selectedDestinationTypeIndex = 1;
          });
        }, _selectedDestinationTypeIndex == 1),
        _destinationType(Icons.directions_walk, () {
          setState(() {
            _selectedDestinationTypeIndex = 2;
          });
        }, _selectedDestinationTypeIndex == 2),
        _destinationType(Icons.motorcycle, () {
          setState(() {
            _selectedDestinationTypeIndex = 3;
          });
        }, _selectedDestinationTypeIndex == 3)
      ],
    );
  }

  _destinationType(IconData icon, Function onClick, bool isSelected) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.lightBlue[50] : Colors.grey[100]),
          child: Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  _bottomBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 30,
            spreadRadius: 1)
      ]),
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _bottomBarItem(Icons.search, () {
            setState(() {
              _selectedBottomBarIndex = 0;
            });
          }, _selectedBottomBarIndex == 0),
          _bottomBarItem(Icons.home, () {
            setState(() {
              _selectedBottomBarIndex = 1;
            });
          }, _selectedBottomBarIndex == 1),
          _bottomBarItem(Icons.person, () {
            setState(() {
              _selectedBottomBarIndex = 2;
            });
          }, _selectedBottomBarIndex == 2)
        ],
      ),
    );
  }

  _bottomBarItem(IconData icon, Function onClick, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: GestureDetector(
        onTap: onClick,
        child: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
          size: 24,
        ),
      ),
    );
  }

  _topDestinationsHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "Top Destinations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              print("On see all click!");
            },
            child: Text(
              "See All",
              style: TextStyle(fontSize: 14, color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }

  _topDestinationsContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _topDestinationItem(
            "Venice",
            "Italy",
            "https://images.unsplash.com/photo-1545157000-85f257f7b040?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            125,
            "Lorem ipsum dolor sit amet",
          ),
          _topDestinationItem(
            "Toronto",
            "Canada",
            "https://images.unsplash.com/photo-1517935706615-2717063c2225?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80",
            99,
            "Lorem ipsum dolor sit amet",
          ),
          _topDestinationItem(
            "Curitiba",
            "Brazil",
            "https://images.unsplash.com/photo-1510846606678-710c05a5c776?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
            72,
            "Lorem ipsum dolor sit amet",
          ),
          _topDestinationItem(
            "Roma",
            "Italy",
            "https://images.unsplash.com/photo-1570069254812-a248c878dcc1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80",
            45,
            "Lorem ipsum dolor sit amet",
          ),
        ],
      ),
    );
  }

  _topDestinationItem(String city, String country, String photo, int activities,
      String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250,
        width: 200,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 48, 16, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$activities activities",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 1)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        photo,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 150,
                      ),
                      Positioned(
                        bottom: 16,
                        left: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              city,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white.withAlpha(200),
                                  size: 12,
                                ),
                                Text(
                                  country,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withAlpha(200)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
