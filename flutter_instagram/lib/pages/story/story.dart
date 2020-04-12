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
            bottom: 0,
            left: 0,
            right: 0,
            child: _blackFadeBackgroundFooter(),
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

  _blackFadeBackgroundFooter() {
    return Container(
      height: _height * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black54, Colors.transparent],
        ),
      ),
    );
  }

  _storyProgressBar() {
    return SafeArea(
      child: Container(
        height: 2,
        child: LinearProgressIndicator(
          value: 0.5,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  _profileHeader() {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/42.jpg"),
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
      ),
    );
  }

  _storyFooter() {
    return SafeArea(
      child: Container(
        height: _height * 0.1,
        width: _width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            Container(
              width: _width * 0.65,
              height: 56,
              child: TextField(
                cursorColor: Colors.white,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintStyle: new TextStyle(color: Colors.grey.shade300),
                    hintText: "Enviar mensagem",
                    suffixIcon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
