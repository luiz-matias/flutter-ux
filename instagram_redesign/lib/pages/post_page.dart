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
    return Container();
  }
}
