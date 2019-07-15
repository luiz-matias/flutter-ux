import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/widgets/feed_item.dart';

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
        FeedItem(
          username: "lorem_ipsum",
          profilePictureUrl:
              "https://randomuser.me/api/portraits/men/47.jpg",
          imageUrl:
              "https://images.unsplash.com/photo-1562956242-b00bc7039bbb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2026&q=80",
          likes: 100,
        ),
        FeedItem(
          username: "dolor_sit",
          profilePictureUrl:
          "https://randomuser.me/api/portraits/men/42.jpg",
          imageUrl:
          "https://images.unsplash.com/photo-1563107468-f5fb78ac7d11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          likes: 100,
        ),
        FeedItem(
          username: "amet",
          profilePictureUrl:
          "https://randomuser.me/api/portraits/women/11.jpg",
          imageUrl:
          "https://images.unsplash.com/photo-1563073140-57edc433a294?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          likes: 100,
        ),
        FeedItem(
          username: "woman",
          profilePictureUrl:
          "https://randomuser.me/api/portraits/women/33.jpg",
          imageUrl:
          "https://images.unsplash.com/photo-1563074408-455d75186f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          likes: 100,
        ),
        FeedItem(
          username: "flutterguy",
          profilePictureUrl:
          "https://randomuser.me/api/portraits/women/39.jpg",
          imageUrl:
          "https://images.unsplash.com/photo-1563028500-6e83e5ae30f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1347&q=80",
          likes: 100,
        ),
      ],
    );
  }

  Widget _feedItem(BuildContext context, String username,
      String profilePictureUrl, String imageUrl) {
    int likes = 1 + Random().nextInt(900);

    //return FeedItem(username, profilePictureUrl, imageUrl, likes);
  }
}
