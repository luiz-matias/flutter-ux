import 'package:flutter/material.dart';
import 'package:instagram_redesign/pages/post_page.dart';

class InstagramProfilePage extends StatefulWidget {
  @override
  _InstagramProfilePageState createState() => _InstagramProfilePageState();
}

class _InstagramProfilePageState extends State<InstagramProfilePage>
    with TickerProviderStateMixin {
  AnimationController imageSizeAnimationController,
      postAlphaAnimationController,
      alphaAnimationController;
  Animation<double> profilePictureSize, postAlphaAnimation, alphaAnimation;

  _InstagramProfilePageState() {
    imageSizeAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    alphaAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    postAlphaAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    profilePictureSize = Tween<double>(begin: 0, end: 128).animate(
        CurvedAnimation(
            parent: imageSizeAnimationController, curve: Curves.easeOutCubic))
      ..addListener(() {
        setState(() {});
      });

    alphaAnimation =
        Tween<double>(begin: 0, end: 1).animate(alphaAnimationController)
          ..addListener(() {
            setState(() {});
          });

    postAlphaAnimation =
        Tween<double>(begin: 0, end: 1).animate(postAlphaAnimationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void initState() {
    super.initState();
    imageSizeAnimationController.forward().whenComplete(() {
      postAlphaAnimationController.forward();
    });
    alphaAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SizedBox.expand(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 56,
            top: 0,
            child: profileBody(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _bottomNavigationBar(),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: Center(
                child: Container(
                  height: 56,
                  width: 56,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF5956CB),
                          Color(0xFFD52C93),
                          Color(0xFFFFCD6C),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: Color(0xFFD52C93),
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100)),
                ),
              )),
        ],
      ),
    ));
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white),
            title: Text("Notifications")),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text("Notifications"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
        ),
      ],
    );
  }

  profileBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 56,
          ),
          _profileHeader(),
          SizedBox(
            height: 32,
          ),
          Opacity(
            opacity: alphaAnimation.value,
            child: _profileInfo(),
          ),
          SizedBox(
            height: 16,
          ),
          Opacity(
            opacity: postAlphaAnimation.value,
            child: _profilePosts(),
          )
        ],
      ),
    );
  }

  _profileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Opacity(
              opacity: alphaAnimationController.value,
              child: Hero(
                tag: 'back',
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  width: 128,
                  height: 128,
                ),
                Center(
                  child: Container(
                    height: profilePictureSize.value,
                    width: profilePictureSize.value,
                    child: Hero(
                      tag: 'avatar',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/image18.jpg",
                          height: profilePictureSize.value,
                          width: profilePictureSize.value,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(40),
                              offset: Offset(0, 10),
                              blurRadius: 10)
                        ]),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                    opacity: postAlphaAnimation.value,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {},
                      child: Icon(Icons.person_add),
                    ),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: alphaAnimationController.value,
              child: Icon(Icons.bookmark_border),
            ),
          ],
        ),
        SizedBox(height: 16),
        Opacity(
          opacity: alphaAnimationController.value,
          child: Text(
            "Luiz Matias",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 4),
        Opacity(
          opacity: alphaAnimationController.value,
          child: Text(
            "@_luizmatias",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        )
      ],
    );
  }

  _profileInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _profileInfoItem("450", "Posts"),
        _profileInfoItem("12.5k", "Followers"),
        _profileInfoItem("345", "Following"),
      ],
    );
  }

  _profileInfoItem(String value, String description) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "$value\n",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        children: [
          TextSpan(
            text: description,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  _profilePosts() {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(15, (index) {
        return Padding(
          padding: EdgeInsets.all(1),
          child: Hero(
            tag: index,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage(index)),
                );
              },
              child: Image.asset(
                "assets/images/image${index + 1}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    imageSizeAnimationController.dispose();
    alphaAnimationController.dispose();
    postAlphaAnimationController.dispose();
    super.dispose();
  }
}
