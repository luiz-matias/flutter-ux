import 'package:flutter/material.dart';
import 'package:flutter_instagram/domain/entities/story.dart';
import 'package:flutter_instagram/domain/entities/user.dart';

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
                  [
                    Story(
                      id: 1,
                      duration: 3,
                      user: User(
                          id: 1,
                          username: "@_luizmatias",
                          user: "Luiz Matias",
                          profilePicture:
                              "https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80"),
                      postedAt: 1586726739000,
                      content:
                          "https://images.unsplash.com/photo-1535865633289-347f691bb824?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
                      contentType: 1,
                      seen: false,
                    ),
                    Story(
                      id: 2,
                      duration: 3,
                      user: User(
                          id: 1,
                          username: "@_luizmatias",
                          user: "Luiz Matias",
                          profilePicture:
                              "https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80"),
                      postedAt: 1586759154000,
                      content:
                          "https://images.unsplash.com/photo-1558573030-bf8ad79522b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
                      contentType: 1,
                      seen: false,
                    ),
                  ],
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

  Widget _storyItem(List<Story> stories) {
    return Material(
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
                            gradient: stories[0].seen
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
                        width: stories[0].seen ? 62 : 60,
                        height: stories[0].seen ? 62 : 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: "content_${stories[0].id}",
                        child: Container(
                          width: 1,
                          height: 1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(stories[0].content),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          "/story",
                          arguments: stories,
                        );
                      },
                      child: Center(
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              NetworkImage(stories[0].user.profilePicture),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                stories[0].user.username.replaceAll("@", ""),
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
