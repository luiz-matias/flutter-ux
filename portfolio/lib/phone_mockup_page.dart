import 'package:flutter/material.dart';

class PhoneMockupPage extends StatelessWidget {
  final String phoneContent;
  final double width, height;

  const PhoneMockupPage(
      {Key key, this.phoneContent, this.width = 1244, this.height = 1788})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
                bottom: 80,
                top: 95,
                child: Image.network(
                  phoneContent,
                  fit: BoxFit.cover,
                  frameBuilder: (context, widget, frame, isAsync) {
                    return Stack(
                      children: [
                        Center(
                          child: AnimatedOpacity(
                            opacity: frame == null ? 1 : 0,
                            duration: Duration(milliseconds: 200),
                            child: SizedBox.expand(
                              child: Container(
                                color: Colors.black,
                                child: Center(
                                  child: Container(
                                    width: 96,
                                    height: 96,
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: AnimatedOpacity(
                            opacity: frame != null ? 1 : 0,
                            duration: Duration(milliseconds: 200),
                            child: SizedBox.expand(child: widget),
                          ),
                        )
                      ],
                    );
                  },
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
