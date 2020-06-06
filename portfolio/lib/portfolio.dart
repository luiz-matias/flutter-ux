import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/phone_mockup_page.dart';
import 'package:portfolio/phone_mockup_page_with_video.dart';
import 'package:video_player/video_player.dart';

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

  Animation<Alignment> titleAlignmentAnimation;
  Animation<double> titleSizeAnimation;
  Animation<double> OSLogosSizeAnimation;
  Animation<Alignment> phoneAlignmentAnimation;
  Animation<double> phoneSizeAnimation;
  Animation<double> phoneRotationAnimation;
  Animation<double> multiplePhonesSizeAnimation;
  Animation<Alignment> multiplePhonesAlignmentAnimation;

  //endregion



  @override
  void initState() {
    super.initState();

    _startingAnimationController = new AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 3000));

    _animationController = new AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 0.3,
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

    Future.delayed(Duration(seconds: 1))
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

    titleAlignmentAnimation =
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

    titleSizeAnimation = new Tween(begin: 1.0, end: 0.3).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeOutQuad,
        ),
      ),
    );

    OSLogosSizeAnimation = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.0,
          0.05,
          curve: Curves.easeInCirc,
        ),
      ),
    );

    phoneAlignmentAnimation = new TweenSequence([
      TweenSequenceItem(
          tween: Tween<Alignment>(
                  begin: Alignment.centerRight, end: Alignment.centerLeft)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween<Alignment>(
                  begin: Alignment.centerLeft, end: Alignment.centerLeft)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
                  begin: Alignment.centerLeft, end: Alignment.center)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 0.5),
    ]).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 0.2),
      ),
    );

    phoneSizeAnimation = new TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.0, end: 3.0)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1),
    ]).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.17, 0.25),
      ),
    );

    phoneRotationAnimation = new TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 0.25)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1),
    ]).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.17, 0.25),
      ),
    );

    multiplePhonesSizeAnimation = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.05,
          0.1,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    multiplePhonesAlignmentAnimation =
        new Tween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
          0.05,
          0.09,
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
        alignment: titleAlignmentAnimation,
        child: ScaleTransition(
          scale: titleSizeAnimation,
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
              scale: OSLogosSizeAnimation,
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
        alignment: phoneAlignmentAnimation,
        child: ScaleTransition(
          scale: phoneSizeAnimation,
          alignment: Alignment.center,
          child: RotationTransition(
            turns: phoneRotationAnimation,
            alignment: Alignment.center,
            child: PhoneMockupPageWithVideo(
              videoUrl: 'videos/profile_clone.mp4',
              width: 400,
            ),
          ),
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
        alignment: multiplePhonesAlignmentAnimation,
        child: ScaleTransition(
          scale: multiplePhonesSizeAnimation,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhoneMockupPageWithVideo(
                videoUrl: "videos/profile_clone.mp4",
                width: 300,
              ),
              PhoneMockupPageWithVideo(
                videoUrl: "videos/profile_clone.mp4",
                width: 300,
              ),
              _width >= 1280
                  ? PhoneMockupPageWithVideo(
                videoUrl: "videos/profile_clone.mp4",
                      width: 300,
                    )
                  : Container(),
              _width >= 1600
                  ? PhoneMockupPageWithVideo(
                videoUrl: "videos/profile_clone.mp4",
                      width: 300,
                    )
                  : Container(),
              _width >= 1920
                  ? PhoneMockupPageWithVideo(
                videoUrl: "videos/profile_clone.mp4",
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
