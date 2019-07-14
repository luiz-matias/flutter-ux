import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/widgets/appbar.dart';
import 'package:flutter_instagram/pages/widgets/feed.dart';
import 'package:flutter_instagram/pages/widgets/navbar.dart';
import 'package:flutter_instagram/pages/widgets/stories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: Column(
          children: <Widget>[
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stories(),
                    Feed(),
                  ],
                ),
              ),
            ),
            CustomNavBar(),
          ],
        ),
      ),
    );
  }
}
