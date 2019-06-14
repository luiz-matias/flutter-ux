import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            _drawerItem("http://chittagongit.com/download/23827", "Conversas", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Orçamento", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Oportunidades de trabalho", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Indique para um amigo", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Seguro de vida", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Seguro residencial", () {print("Click nas conversas");}),
            _drawerItem("http://chittagongit.com/download/23827", "Logout", () {print("Click nas conversas");}),
          ],
        ),
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
            Icon(Icons.person),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }

}
