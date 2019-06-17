import 'package:flutter/material.dart';

import 'pages/note_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent),
      home: NoteDetailsPage(),
    );
  }
}
