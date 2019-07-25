import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 1;
  PageController _verticalViewPagerController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7F269D),
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
          Positioned(
            top: 116,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF7F269D), Color(0x007F269D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _titleBar() {
    return GestureDetector(
      onTap: () {
        if (_currentPage == 0)
          _verticalViewPagerController.animateToPage(1,
              curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
        else
          _verticalViewPagerController.animateToPage(0,
              curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
      },
      child: Padding(
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
            _currentPage == 0
                ? Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.grey[300],
                  )
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[300],
                  )
          ],
        ),
      ),
    );
  }

  _profile() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
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
              onPressed: () {
                Navigator.pop(context);
              },
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

  _pageViews() {
    return PageView(
      physics: BouncingScrollPhysics(),
      onPageChanged: (page) {
        setState(() {
          _currentPage = page;
        });
      },
      controller: _verticalViewPagerController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _profile(),
        Stack(
          children: <Widget>[
            Positioned(
              top: 16,
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
                      child: _creditCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: _nuAccount(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: _nuRewards(),
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

  _creditCard() {
    return Card(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.credit_card,
                  color: Colors.grey[500],
                  size: 36,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Cartão de crédito",
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, -0.25),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Fatura atual".toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "R\$ ",
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        TextSpan(
                          text: "204",
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ",50",
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Limite disponível ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "R\$ 1395,50",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.directions_car,
                      size: 36,
                      color: Colors.grey[700],
                    ),
                  ),
                  LimitedBox(
                      maxWidth: 180,
                      child: Text(
                        "Compra mais recente em Uber no valor de R\$ 11,40 hoje",
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 36,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 16,
              top: 16,
              bottom: 116,
              child: Container(
                height: double.infinity,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.13,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  topLeft: Radius.circular(4)),
                              color: Colors.blueAccent),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.87,
                          width: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                              color: Colors.green),
                        ),
                      ],
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

  _nuAccount() {
    return Card(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.monetization_on,
                  color: Colors.grey[500],
                  size: 36,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "NuConta",
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, -0.25),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Saldo disponível",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "R\$ 998,74",
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.fastfood,
                      size: 36,
                      color: Colors.grey[700],
                    ),
                  ),
                  LimitedBox(
                      maxWidth: 180,
                      child: Text(
                        "Compra mais recente em Cafeteria do Viajante no valor de R\$ 11,40 hoje",
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 36,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: 24,
            child: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  _nuRewards() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.card_giftcard,
            size: 32,
          ),
          Text(
            "Nubank Rewards",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 64),
            child: Text(
              "Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente usa.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 64),
            child: Container(
              height: 50,
              width: double.infinity,
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                borderSide: BorderSide(
                  color: Color(0xFF7F269D),
                ),
                onPressed: () {},
                child: Text(
                  "Ative o seu rewards".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7F269D),
                  ),
                ),
              ),
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

  _options() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                elevation: 0,
                color: Color.fromARGB(50, 255, 255, 255),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Text(
                        "Cartão virtual",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Bloquear cartão",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Pagar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Depositar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Cobrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Transferir",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.line_weight,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Ajustar limite",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(50, 255, 255, 255),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      "Indicar amigos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                elevation: 0,
                color: Color.fromARGB(50, 255, 255, 255),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Text(
                        "Organizar atalhos",
                        style: TextStyle(color: Colors.white),
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
}
