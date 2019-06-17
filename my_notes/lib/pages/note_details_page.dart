import 'package:flutter/material.dart';
import 'package:flutter_parallax/flutter_parallax.dart';

class NoteDetailsPage extends StatelessWidget {
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
      child: ListView(
        children: <Widget>[
          Parallax.inside(
            child: Image.network(
              "https://handluggageonly.co.uk/wp-content/uploads/2018/02/Hand-Luggage-Only-8-5.jpg",
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.cover,
            ),
            mainAxisExtent: 150,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "NATURE",
                      style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipOval(
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png",
                                width: 18,
                                height: 18,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          "Italy journey",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Explore the world.\nBe one with nature.\n\n\n\nTest\n\n\n\nTest\n\n\n\nTest\n\n\n\nTest\n\n\n\nTest\n\n\n\nTest",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
