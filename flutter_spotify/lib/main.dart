import 'package:flutter/material.dart';
import 'package:flutter_spotify/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color(0xFF222327),
        accentColor: Color(0xFF1DB954)
      ),
      home: HomePage(),
    );
  }
}

