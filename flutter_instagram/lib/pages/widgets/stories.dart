import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/story/story.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _myStoryItem(),
                _storyItem(
                  "sampleuser",
                  "https://randomuser.me/api/portraits/men/27.jpg",
                  false,
                ),
                _storyItem(
                  "otheruser",
                  "https://randomuser.me/api/portraits/men/91.jpg",
                  false,
                ),
                _storyItem(
                  "moreuser",
                  "https://randomuser.me/api/portraits/women/60.jpg",
                  false,
                ),
                _storyItem(
                  "heyguys",
                  "https://randomuser.me/api/portraits/women/58.jpg",
                  true,
                ),
                _storyItem(
                  "flutter",
                  "https://randomuser.me/api/portraits/women/27.jpg",
                  true,
                ),
                _storyItem(
                  "is",
                  "https://randomuser.me/api/portraits/men/51.jpg",
                  true,
                ),
                _storyItem(
                  "awesome",
                  "https://randomuser.me/api/portraits/men/60.jpg",
                  true,
                ),
              ],
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

  Widget _myStoryItem() {
    return Container(
      width: 84,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                        "https://avatars3.githubusercontent.com/u/29527763?s=460&v=4"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Your Story",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.7, 0.6),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: Icon(
                  Icons.add_circle,
                  size: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _storyItem(String username, String profilePicture, bool storySeen) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StoryPage(),
          )
        );
      },
      child: Container(
        width: 84,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 64,
                height: 64,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: storySeen
                                ? LinearGradient(
                                    colors: [Colors.grey, Colors.grey])
                                : LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.deepPurple
                                  ])),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: storySeen ? 62 : 60,
                        height: storySeen ? 62 : 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(profilePicture),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                username,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
