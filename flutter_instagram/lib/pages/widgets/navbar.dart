import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        elevation: 4,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
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
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            title: Text("Likes"),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text("Likes"),
            icon: CircleAvatar(
              backgroundImage: NetworkImage("https://avatars3.githubusercontent.com/u/29527763?s=460&v=4"),
              radius: 12,
            )
          ),
        ],
      ),
    );
  }
}
