import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 56.0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Icon(Icons.photo_camera),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      "Fluttergram",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.ondemand_video),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.send),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }
}
