import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final int imageIndex;

  PostPage(this.imageIndex);

  @override
  _PostPageState createState() => _PostPageState(imageIndex);
}

class _PostPageState extends State<PostPage> {
  final int imageIndex;

  _PostPageState(this.imageIndex);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              _toolbar(),
              Hero(
                tag: imageIndex,
                child: Image.asset(
                  "assets/images/image${imageIndex + 1}.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              _postInfo(),
            ],
          ),
        ),
      ),
    );
  }

  _toolbar() {
    return Container(
      height: 56,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: 'back',
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/image18.jpg",
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Luiz Matias",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          )),
          Icon(Icons.more_horiz),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  _postInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _postActions(),
        _postDescription(),
        _postComments(),
      ],
    );
  }

  _postActions() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.favorite,
          ),
          SizedBox(
            width: 16,
          ),
          Icon(Icons.add_comment),
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
    );
  }

  _postDescription() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: RichText(
        text: TextSpan(
          text: "@_luizmatias: ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          children: [
            TextSpan(
              text: "Just a Lorem ipsum dolor sit amet in your screen... Follow me on instagram 🎉",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  _postComments() {
    return Opacity(
      opacity: 0.5,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: <Widget>[
            _comment(),
            _comment(),
            _comment(),
            _comment(),
            _comment(),
            _comment(),
            _comment(),
          ],
        ),
      ),
    );
  }

  _comment() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: RichText(
        text: TextSpan(
          text: "@_somesampleuser ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          children: [
            TextSpan(
              text: "Another one Lorem ipsum dolor sit amet",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
