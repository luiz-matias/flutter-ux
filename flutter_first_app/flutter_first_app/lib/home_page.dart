import 'package:flutter/material.dart';

import 'common_widgets/drawer.dart';
import 'pages/chat_room_page.dart';
import 'pages/list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text("Truck Help"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: ListView(
            children: <Widget>[
              _drawerItem("http://chittagongit.com/download/23827", "Conversas",
                  () => navigateToPage(ChatRoomPage())),
              _drawerItem("http://chittagongit.com/download/23827", "Lista",
                  () => navigateToPage(ListPage())),
              _drawerItem("http://chittagongit.com/download/23827", "Conversas",
                  () => navigateToPage(ChatRoomPage())),
            ],
          ),
        ),
      ),
      body: SafeArea(child: _body()),
    );
  }

  _body() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Text("Olá mundo!"),
      ),
    );
  }

  _drawerItem(String image, String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image.network(
              image,
              width: 12,
              height: 12,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  navigateToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
