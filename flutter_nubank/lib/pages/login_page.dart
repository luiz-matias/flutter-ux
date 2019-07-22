import 'package:flutter/material.dart';
import 'package:flutter_nubank/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    if (_currentPage == 0) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
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
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
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
                      style: TextStyle(fontSize: 24),
                      autofocus: true,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _currentPage = 1;
                        });
                      },
                      child: Text(
                        "Continuar".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[500]),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentPage = 0;
                          });
                        },
                        child: Icon(Icons.arrow_back,
                            color: Colors.grey, size: 48),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Digite sua ",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                        TextSpan(
                            text: "senha de acesso ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "de 8 dígitos",
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
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
                      style: TextStyle(fontSize: 24),
                      autofocus: true,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _navigateToHome();
                      },
                      child: Text(
                        "Entrar".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[500]),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }
}
