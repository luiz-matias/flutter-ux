import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PhoneMockupPageWithVideo extends StatefulWidget {
  final String videoUrl;
  final double width, height;

  const PhoneMockupPageWithVideo(
      {Key key, this.videoUrl, this.width = 1244, this.height = 1788})
      : super(key: key);

  @override
  _PhoneMockupPageWithVideoState createState() =>
      _PhoneMockupPageWithVideoState(videoUrl, width, height);
}

class _PhoneMockupPageWithVideoState extends State<PhoneMockupPageWithVideo> {
  final String videoUrl;
  final double width, height;

  //VideoPlayer
  VideoPlayerController _controller;

  _PhoneMockupPageWithVideoState(this.videoUrl, this.width, this.height);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(videoUrl)
      ..setVolume(0.0)
      ..setLooping(true)
      ..addListener(() => setState(() {}))
      ..initialize().then((_) => setState(() {
            print("Video loaded!");
            _controller.play();
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: 1244,
          height: 1788,
          child: Stack(
            children: [
              Positioned(
                left: 250,
                right: 250,
                bottom: 60,
                top: 60,
                child: SizedBox.expand(
                  child: Container(
                    color: Colors.black,
                    child: _controller.value.initialized
                        ? AspectRatio(
                      aspectRatio: 1788 / 1244,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                  ),
                ),
              ),
              Positioned(
                child: Image.network("https://i.imgur.com/JcPeOSP.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
