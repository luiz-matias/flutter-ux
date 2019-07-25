import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(height: 56, color: Colors.black,),
        ),
      ],
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedFontSize: 10,
      unselectedFontSize: 10,
      iconSize: 32,
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Início"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Buscar"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          title: Text("Sua biblioteca"),
        )
      ],
    );
  }
}
