import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _feedItem(context),
        _feedItem(context),
        _feedItem(context),
        _feedItem(context),
        _feedItem(context),
        _feedItem(context),
        _feedItem(context),
      ],
    );
  }

  Widget _feedItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/29527763?s=460&v=4"),
                  radius: 12,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "_luizmatias",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          Image.network(
            "https://antonioleiva.com/wp-content/uploads/2018/09/clean-architecture-graph.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite_border),
                SizedBox(
                  width: 16,
                ),
                Icon(Icons.chat_bubble_outline),
                SizedBox(
                  width: 16,
                ),
                Icon(Icons.message),
                Expanded(
                  child: Container(),
                ),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
              "132,784 likes",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '_luizmatias ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Lorem ipsum dolor sit amet!',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
              "View all 386 comments",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/29527763?s=460&v=4"),
                  radius: 12,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Add a comment...",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
