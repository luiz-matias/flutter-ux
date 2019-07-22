import 'package:flutter/material.dart';
import 'package:flutter_nubank/pages/access_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
      ),
      home: AccessPage(),
    );
  }
}
