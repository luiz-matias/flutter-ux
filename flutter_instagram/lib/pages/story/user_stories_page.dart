import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/domain/entities/story.dart';

class UserStoriesPage extends StatefulWidget {
  final List<Story> stories;

  const UserStoriesPage({Key key, this.stories}) : super(key: key);

  @override
  _UserStoriesPageState createState() => _UserStoriesPageState(stories);
}

class _UserStoriesPageState extends State<UserStoriesPage>
    with SingleTickerProviderStateMixin {
  final List<Story> stories;
  var _width;
  var _height;
  bool userPausedStory = false;
  int currentStory = 0;
  AnimationController storyProgressController;

  _UserStoriesPageState(this.stories);

  @override
  void initState() {
    super.initState();

    storyProgressController = AnimationController(
      duration: Duration(seconds: stories[currentStory].duration),
      vsync: this,
    )..addListener(() {
        if (storyProgressController.isCompleted) {
          moveToNextStory();
        }
        setState(() {});
      });

    storyProgressController.forward();
  }

  void moveToNextStory() {
    if (currentStory >= stories.length - 1) {
      Navigator.of(context).pop();
    } else {
      currentStory++;
      storyProgressController.reset();
      storyProgressController.forward();
    }
  }

  void moveToPreviousStory() {
    if (currentStory > 0) {
      currentStory--;
      storyProgressController.reset();
      storyProgressController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onLongPressStart: (_) {
        userPausedStory = true;
        storyProgressController.stop();
      },
      onTapUp: (details) {
        if (details.globalPosition.dx > _width / 2) {
          moveToNextStory();
        } else {
          moveToPreviousStory();
        }
      },
      onLongPressEnd: (_) {
        userPausedStory = false;
        storyProgressController.forward();
      },
      onVerticalDragEnd: (_) {
        Navigator.of(context).pop();
      },
      child: Hero(
        tag: "content_${stories[0].id}",
        child: Material(
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              image: DecorationImage(
                image: NetworkImage(stories[currentStory].content),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: _blackFadeBackgroundHeader(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _blackFadeBackgroundFooter(),
                ),
                Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  child: _storyProgressBar(),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: _profileHeader(),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: _storyFooter(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _blackFadeBackgroundHeader() {
    return Container(
      height: _height * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black54, Colors.transparent],
        ),
      ),
    );
  }

  _blackFadeBackgroundFooter() {
    return Container(
      height: _height * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black54, Colors.transparent],
        ),
      ),
    );
  }

  _storyProgressBar() {
    List<Widget> progressBars = [];

    for (int i = 0; i < stories.length; i++) {
      double progress;
      if (currentStory > i) {
        progress = 1;
      } else if (currentStory == i) {
        progress = storyProgressController.value;
      } else {
        progress = 0;
      }

      progressBars.add(Container(
        width: ((_width) / stories.length),
        height: 2,
        padding: EdgeInsets.only(left: 2, right: 2),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ));
    }

    return SafeArea(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: progressBars,
          ),
        ),
      ),
    );
  }

  _profileHeader() {
    return SafeArea(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Row(
          children: <Widget>[
            Container(
              width: 36,
              height: 36,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(stories[currentStory].user.profilePicture),
                radius: 12,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      stories[currentStory].user.username,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(stories[currentStory].postedAtInHumanFormat,
                        style: TextStyle(
                            color: Colors.white.withAlpha(200), fontSize: 16)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _storyFooter() {
    return SafeArea(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: _height * 0.1,
          width: _width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
              Container(
                width: _width * 0.65,
                height: 56,
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintStyle: new TextStyle(color: Colors.grey.shade300),
                    prefix: SizedBox(
                      width: 8,
                    ),
                    hintText: "Enviar mensagem",
                    suffixIcon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    storyProgressController.dispose();
    super.dispose();
  }
}
