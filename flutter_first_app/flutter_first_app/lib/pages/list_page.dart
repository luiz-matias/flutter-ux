import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: _listView(),
      ),
    );
  }

  _listView() {
    List<String> lista = List.generate(60, (index) {
      return "Item ${index+1}";
    });

    return ListView.builder(
      itemCount: lista.length,
        itemBuilder: (context, index) {
      return Center(child: Text(lista[index]));
    });
  }
}
