import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _titleBar(),
          ),
          Positioned(
            top: 116,
            left: 0,
            right: 0,
            bottom: 0,
            child: _pageViews(),
          ),
        ],
      ),
    );
  }

  _titleBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo-nu.png",
                color: Colors.white,
                width: 48,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Luiz Matias",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }

  _pageViews() {
    return PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _profile(),
        Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Card(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(height: 100, child: Card()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(height: 100, child: Card()),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: _options(),
            ),
          ],
        ),
      ],
    );
  }

  _options() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              color: Color.fromARGB(100, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }

  _points() {
    return Row(
      children: <Widget>[
        Icon(Icons.control_point),
        Icon(Icons.control_point),
        Icon(Icons.control_point)
      ],
    );
  }

  _profile() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/qr_code.png",
            width: 96,
            height: 96,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Banco ",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                TextSpan(
                    text: "260 - Nu Pagamentos S.A.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Agência ",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                TextSpan(
                    text: "0001",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Conta ",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                TextSpan(
                    text: "1234567-8",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Me ajuda",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.question_answer,
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Perfil",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Nome de preferência, telefone, e-mail",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Configurar NuConta",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Configurar Cartão",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Configurações do app",
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.phone_android,
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white54,
          ),
          SizedBox(
            height: 8,
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
                "Sair da conta".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
