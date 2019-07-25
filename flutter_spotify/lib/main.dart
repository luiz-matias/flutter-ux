import 'package:flutter/material.dart';
import 'package:flutter_spotify/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.grey.shade900,
        accentColor: Colors.green
      ),
      home: HomePage(),
    );
  }
}