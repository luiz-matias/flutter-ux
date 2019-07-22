import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: Colors.grey, size: 48),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Para acessar o app digite o seu ",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                TextSpan(
                    text: "CPF",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: TextField(
              maxLines: 1,
              minLines: 1,
              cursorColor: Colors.black,
              cursorWidth: 2,
              decoration: InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              autofocus: true,
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.grey[300],
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Continuar".toUpperCase(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
