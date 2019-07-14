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
                  Icon(Icons.camera_alt),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "Fluttergram",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.video_library),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.message),
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
