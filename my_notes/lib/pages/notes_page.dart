import 'package:flutter/material.dart';
import 'package:flutter_parallax/flutter_parallax.dart';

class NotesPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.black87,
        child: _body(),
      ),
    );
  }

  _body() {
    return SafeArea(
      top: true,
      child: ListView(
        children: <Widget>[
          Container(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "My Journey",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "You have 5 trip notes",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
                children: <Widget>[
                  _noteItem(),
                  _noteItem(),
                  _noteItem(),
                  _noteItem(),
                ],
            ),
          )
        ],
      ),
    );
  }

  _noteItem() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png",
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 2,
                height: 210,
                color: Colors.grey[700],
              ),
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
              SizedBox(
                height: 8,
              ),
              Text(
                "Posted 2 months ago",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Parallax.inside(
                    mainAxisExtent: 150,
                    child: Image.network(
                      "https://handluggageonly.co.uk/wp-content/uploads/2018/02/Hand-Luggage-Only-8-5.jpg",
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
