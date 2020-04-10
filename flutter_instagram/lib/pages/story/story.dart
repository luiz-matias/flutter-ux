import 'dart:ui';

import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  var _width;
  var _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              width: _width,
              height: _height,
              child: Container(
                color: Colors.black,
                child: Image.network(
                  "https://images.unsplash.com/photo-1562956242-b00bc7039bbb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2026&q=80",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _blackFadeBackgroundHeader(),
            ),
            Positioned(
              top: 8,
              left: 4,
              right: 4,
              child: _storyProgressBar(),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: _profileHeader(),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: _storyFooter(),
            ),
          ],
        ),
      ),
    );
  }

  _blackFadeBackgroundHeader() {
    return Container(
      height: _height * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black54, Colors.transparent],
        ),
      ),
    );
  }

  _storyProgressBar() {
    return Container(
      height: 2,
      color: Colors.white,
    );
  }

  _profileHeader() {
    return Row(
      children: <Widget>[
        Container(
          width: 36,
          height: 36,
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://randomuser.me/api/portraits/men/42.jpg"),
            radius: 12,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "_luizmatias",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("9 h",
                    style: TextStyle(
                        color: Colors.white.withAlpha(200), fontSize: 16)),
              ],
            )
          ],
        )
      ],
    );
  }

  _storyFooter() {
    return Container(
      height: _height * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.camera,
            color: Colors.white,
          ),
          //TODO input text here
          Icon(
            Icons.send,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
