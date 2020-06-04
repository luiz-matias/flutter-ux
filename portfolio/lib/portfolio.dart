import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/phone_mockup_page.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  double _width, _height;
  double _scrollSizeFactor = 10;
  double _maxValue;
  ScrollController _scrollController = new ScrollController();
  double _progress = 0;
  AnimationController _startingAnimationController;
  AnimationController _animationController;

  //region Tween Animations Introduction
  Animation<double> solidToTransparentBackgroundAnimation;
  Animation<double> solidToTransparentProgresBarAnimation;

  Animation<Alignment> moveCenterLeftToTopLeftAnimation;
  Animation<double> sizeToHalfAnimation;
  Animation<double> decreaseOSLogosSizeAnimation;
  Animation<Alignment> moveRightCenterToLeftCenterAnimation;

  Animation<double> sizeZeroToOneAnimation;
  Animation<Alignment> moveLeftCenterToCenterAnimation;

  //endregion

  @override
  void initState() {
    super.initState();

    _startingAnimationController = new AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 2000));

    _animationController = new AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 0.1,
        duration: Duration(milliseconds: 3000));

    setupAnimations();

    _scrollController.addListener(onScroll);
    _animationController.addListener(() {
      print("Valor do animation: ${_animationController.value}");
    });

    _startingAnimationController.addListener(() {
      if (_startingAnimationController.status == AnimationStatus.completed) {
        _animationController.forward();
      }
    });

    Future.delayed(Duration(seconds: 10))
        .then((value) => _startingAnimationController.forward());
  }

  void onScroll() {
    setState(() {
      _progress = _scrollController.position.pixels / _maxValue;
    });
    print("Current progress of scroll: $_progress");
    _animationController.animateTo(_progress,
        duration: Duration(milliseconds: 500));
  }

  void setupAnimations() {
    solidToTransparentBackgroundAnimation =
        new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _startingAnimationController,
        curve: new Interval(
          0.66,
          1,
          curve: Curves.linear,
        ),
      ),
    );

    solidToTransparentProgresBarAnimation =
        new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _startingAnimationController,
        curve: new Interval(
          0.33,
          0.65,
          curve: Curves.linear,
        ),
      ),
    );

    moveCenterLeftToTopLeftAnimation =
        new Tween(begin: Alignment.centerLeft, end: Alignment.topLeft).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeInOut,
        ),
      ),
    );

    sizeToHalfAnimation = new Tween(begin: 1.0, end: 0.3).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeOutQuad,
        ),
      ),
    );

    decreaseOSLogosSizeAnimation = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeInCirc,
        ),
      ),
    );

    moveRightCenterToLeftCenterAnimation =
        new Tween(begin: Alignment.centerRight, end: Alignment.centerLeft)
            .animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeInOut,
        ),
      ),
    );

    sizeZeroToOneAnimation = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.05,
          0.1,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    moveLeftCenterToCenterAnimation =
        new Tween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.05,
          0.1,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _maxValue = _height * (_scrollSizeFactor - 1);

    return _content();
  }

  Widget _content() {
    return Material(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: _introductionSection(),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: solidToTransparentBackgroundAnimation,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: FadeTransition(
                opacity: solidToTransparentProgresBarAnimation,
                child: Container(
                  width: 128,
                  height: 128,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                height: _height * _scrollSizeFactor,
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _introductionSection() {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black, Colors.black.withAlpha(230)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: Stack(
        children: [
          _OSLogos(),
          _phonesMockup(),
          _firstPhoneMockup(),
          _title(),
        ],
      ),
    );
  }

  _title() {
    return Positioned(
      left: 32,
      top: -38,
      bottom: 0,
      right: 0,
      child: AlignTransition(
        alignment: moveCenterLeftToTopLeftAnimation,
        child: ScaleTransition(
          scale: sizeToHalfAnimation,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Luiz Matias",
                style: TextStyle(
                  fontSize: 96,
                  color: Colors.white.withAlpha(240),
                ),
              ),
              Text(
                "Mobile Developer",
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white.withAlpha(240),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _OSLogos() {
    double imageSize = _width > 1280 ? 96 : 48;

    return _width > 1024
        ? Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: ScaleTransition(
              alignment: Alignment.center,
              scale: decreaseOSLogosSizeAnimation,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://i.imgur.com/nDG7pVD.png",
                      height: imageSize),
                  Image.network(
                      "https://marcas-logos.net/wp-content/uploads/2019/12/Android-Logo.png",
                      height: imageSize),
                  Image.network("https://i.imgur.com/WzMnZwK.png",
                      height: imageSize),
                ],
              ),
            ),
          )
        : Container();
  }

  _firstPhoneMockup() {
    return Positioned(
      right: 0,
      left: 0,
      top: 80,
      bottom: 80,
      child: AlignTransition(
        alignment: moveRightCenterToLeftCenterAnimation,
        child: PhoneMockupPage(
          phoneContent:
              "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/profile_clone.gif",
          width: 400,
        ),
      ),
    );
  }

  _phonesMockup() {
    return Positioned(
      right: 0,
      left: -100,
      top: 80,
      bottom: 80,
      child: AlignTransition(
        alignment: moveLeftCenterToCenterAnimation,
        child: ScaleTransition(
          scale: sizeZeroToOneAnimation,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhoneMockupPage(
                phoneContent:
                    "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/nubank.gif",
                width: 300,
              ),
              PhoneMockupPage(
                phoneContent:
                    "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/profile_clone.gif",
                width: 300,
              ),
              _width >= 1280
                  ? PhoneMockupPage(
                      phoneContent:
                          "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/nubank.gif",
                      width: 300,
                    )
                  : Container(),
              _width >= 1600
                  ? PhoneMockupPage(
                      phoneContent:
                          "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/profile_clone.gif",
                      width: 300,
                    )
                  : Container(),
              _width >= 1920
                  ? PhoneMockupPage(
                      phoneContent:
                          "https://raw.githubusercontent.com/luiz-matias/flutter-ux/master/readmesrc/nubank.gif",
                      width: 300,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
