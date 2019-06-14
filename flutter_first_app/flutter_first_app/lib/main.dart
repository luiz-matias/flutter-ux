import 'package:flutter/material.dart';
import 'package:flutter_first_app/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.blueAccent,
        ),
        home: HomePage());
  }
}
