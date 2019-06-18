import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black87,
        child: _body(),
      ),
    );
  }

  _body() {
    return SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: <Widget>[
              Container(
                height: 32,
              ),
              Text(
                "My Journey",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 8,
              ),
              Text(
                "You have 5 trip notes",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
              Container(
                height: 32,
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: _noteItem(),
                  )
                ],
              )
            ],
          ),
        ));
  }

  _noteItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 3,
            ),
            ClipOval(
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png",
                width: 18,
                height: 18,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 2,
              height: 300,
              color: Colors.grey[700],
            )
          ],
        ),
        Container(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Milan, Italy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Posted 2 months ago",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
