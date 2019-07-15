import 'package:flutter/material.dart';
import 'navbar_enum.dart';

class CustomNavBar extends StatefulWidget {

  ValueChanged<CustomNavBarItem> onTap;


  CustomNavBar({this.onTap});

  @override
  _CustomNavBarState createState() => _CustomNavBarState(onTap);
}

class _CustomNavBarState extends State<CustomNavBar> {
  int index = 0;
  ValueChanged<CustomNavBarItem> onTap;


  _CustomNavBarState(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        elevation: 4,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          switch (index) {
            case 0:
              onTap(CustomNavBarItem.Home);
              break;
            case 1:
              onTap(CustomNavBarItem.Search);
              break;
            case 2:
              onTap(CustomNavBarItem.Add);
              break;
            case 3:
              onTap(CustomNavBarItem.Notifications);
              break;
            case 4:
              onTap(CustomNavBarItem.Profile);
              break;
          }
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Add"),
            icon: Icon(Icons.add_circle_outline),
          ),
          BottomNavigationBarItem(
            title: Text("Likes"),
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            title: Text("Likes"),
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/29527763?s=460&v=4"),
              radius: 12,
            ),
          ),
        ],
      ),
    );
  }
}
