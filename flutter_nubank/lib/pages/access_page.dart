import 'package:flutter/material.dart';
import 'package:flutter_nubank/pages/login_page.dart';
import 'package:flutter_nubank/widgets/custom_modal_bottom_sheet.dart';

class AccessPage extends StatefulWidget {
  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/nubank_access_background.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Color(0x80000000),
          ),
          SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/logo.png",
                        color: Colors.white,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 96,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ser Nubank é\nter uma vida\nfinanceira\ndescomplicada.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        child: Text(
                          "Quero ser Nubank".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(160, 255, 255, 255),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Já tenho convite".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(160, 255, 255, 255),
                        ),
                        onPressed: () {
                          _openLoginPage(context);
                        },
                        child: Text(
                          "Login".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openLoginPage(BuildContext context) {
    showModalBottomSheetApp(
        context: context,
        builder: (context) {
          return LoginPage();
        });
  }
}
