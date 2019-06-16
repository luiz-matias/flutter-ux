import 'package:flutter/material.dart';

import 'pages/chat_room_page.dart';
import 'pages/list_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        primary: true,
        appBar: AppBar(
          title: Text("Truck Help"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Tab 1", icon: Icon(Icons.favorite),),
              Tab(text: "Tab 2", icon: Icon(Icons.favorite),),
              Tab(text: "Tab 3", icon: Icon(Icons.favorite),),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black87,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Luiz Matias"),
                  accountEmail: Text("luiz.matias@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://banner2.kisspng.com/20180329/bpq/kisspng-avatar-education-professor-user-profile-faculty-boss-5abcab3d64aff2.9884136415223140454124.jpg"),
                  ),
                ),
                _drawerItem(Icons.people, "Conversas",
                    () => navigateToPage(ChatRoomPage())),
                _drawerItem(
                    Icons.list, "Lista", () => navigateToPage(ListPage())),
                _drawerItem(Icons.people, "Conversas",
                    () => navigateToPage(ChatRoomPage())),
              ],
            ),
          ),
        ),
        body: TabBarView(
            children: <Widget> [
              Builder(builder: (context) {
                _scaffoldContext = context;
                return SafeArea(child: _body());
              }),
              Builder(builder: (context) {
                _scaffoldContext = context;
                return SafeArea(child: _body());
              }),
              Builder(builder: (context) {
                _scaffoldContext = context;
                return SafeArea(child: _body());
              }),
            ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onClickToast();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  _body() {
    return Center(
      child: SizedBox.expand(
        child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _onClickSnackbar(),
                    child: Text("Snackbar"),
                  ),
                  RaisedButton(
                    onPressed: () => _onClickAlertDialog(),
                    child: Text("AlertDialog"),
                  ),
                  RaisedButton(
                    onPressed: () => _onClickToast(),
                    child: Text("Toast"),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _drawerItem(IconData icon, String title, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(title, style: TextStyle(color: Colors.grey)),
    );
  }

  navigateToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  _onClickSnackbar() {
    Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
      content: Text("Olá mundo!"),
    ));
  }

  _onClickAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Título"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Entendi"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Olá mundo!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
