import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 64, 16, 16),
          child: _body(),
        ),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 4),
              width: 80,
              height: 8,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Container(
            height: 64,
          ),
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                Container(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                )
              ],
            ),
          ),
          Container(
            height: 32,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Forgot password?",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            height: 64,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              onPressed: () {
              },
              color: Colors.deepPurpleAccent,
              child: Text("Sign In".toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          )
        ],
      ),
    );
  }
}
