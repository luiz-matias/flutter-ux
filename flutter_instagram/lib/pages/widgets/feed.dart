import 'dart:math';

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
        _feedItem(
          context,
          "sampleuser",
          "https://randomuser.me/api/portraits/men/27.jpg",
          "https://images.unsplash.com/photo-1562956242-b00bc7039bbb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2026&q=80",
        ),
        _feedItem(
          context,
          "otheruser",
          "https://randomuser.me/api/portraits/men/91.jpg",
          "https://images.unsplash.com/photo-1562967282-7c5eae3fd809?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        ),
        _feedItem(
          context,
          "moreuser",
          "https://randomuser.me/api/portraits/women/60.jpg",
          "https://images.unsplash.com/photo-1562984933-9bdcd3c1893c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
        ),
        _feedItem(
          context,
          "flutter",
          "https://randomuser.me/api/portraits/women/27.jpg",
          "https://images.unsplash.com/photo-1562982095-61e50780f5ac?ixlib=rb-1.2.1&auto=format&fit=crop&w=2134&q=80",
        ),
        _feedItem(
          context,
          "is",
          "https://randomuser.me/api/portraits/men/51.jpg",
          "https://images.unsplash.com/photo-1562937329-9ee5fcbcb71f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
        ),
        _feedItem(
          context,
          "awesome",
          "https://randomuser.me/api/portraits/men/60.jpg",
          "https://images.unsplash.com/photo-1562940922-02c838af3fdd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
        ),
      ],
    );
  }

  Widget _feedItem(BuildContext context, String username,
      String profilePictureUrl, String imageUrl) {
    int likes = 1 + Random().nextInt(900);

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
                  backgroundImage: NetworkImage(profilePictureUrl),
                  radius: 12,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          Image.network(
            imageUrl,
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
                Icon(Icons.send),
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
              "$likes likes",
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
                    text: '$username ',
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
