import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _image(),
            _image(),
          ],
        ),
      ),
    );
  }

  _image() {
    return Image.network("https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg", width: 48, height: 48);
  }
}
