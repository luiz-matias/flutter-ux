import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Own Instagram!',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.blue
      ),
      home: MainPage(),
    );
  }
}
