import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          bottom: 60,
          child: _homeFeed(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _player(),
        ),
      ],
    );
  }

  _bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 1,
          color: Colors.black,
        ),
        BottomNavigationBar(
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 32,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Início"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Buscar"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text("Sua biblioteca"),
            )
          ],
        ),
      ],
    );
  }

  _player() {
    return Container(
      height: 60,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 1,
              width: MediaQuery.of(context).size.width,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[900],
                valueColor: AlwaysStoppedAnimation(Colors.white),
                value: 0.3,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 8,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
              size: 36,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 8,
            child: Icon(
              Icons.pause_circle_outline,
              color: Colors.white,
              size: 36,
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bloom",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " • ",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "ODESZA",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _homeFeed() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          _recentPlayedItemList(),
          _feedItemList("Feito para Luiz"),
          _feedItemList("Escute de novo"),
          _feedItemList("Não sai dos seus ouvidos"),
          _feedItemList("Não deixe a música parar"),
          _feedItemList("Para fãs de David Bowie"),
        ],
      ),
    );
  }

  _recentPlayedItemList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            "Tocadas recentemente",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 80),
          child: _playlistsAndArtistsRow(),
        ),
      ],
    );
  }

  _feedItemList(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 64),
          child: _playlistsAndArtistsRow(),
        ),
      ],
    );
  }

  _playlistsAndArtistsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          _artistItem(),
          _playlistItem(),
          _playlistItem(),
          _artistItem(),
          _playlistItem(),
          _playlistItem(),
          _artistItem(),
          _playlistItem(),
          _playlistItem(),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  _playlistItem() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
            "https://img.discogs.com/PonUjc5SU7ugfK-oL3gSmVjL_AE=/fit-in/600x531/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-12407193-1534669705-2096.jpeg.jpg",
            width: 128,
            height: 128,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Daily Mix 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  _artistItem() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            width: 128.0,
            height: 128.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://www.januaryjane.com/wp-content/uploads/2016/09/music-album-06.jpg",
                  scale: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Some artist",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
