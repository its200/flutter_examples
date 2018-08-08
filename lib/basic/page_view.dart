import 'dart:math';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  static const String routeName = '/page_view';

  @override
  State createState() => MyPageViewState();
}

class MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();

  static Duration _kDuration = Duration(milliseconds: 300);

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Hello"), Text("Yes, it's flutter")],
        ),
      ),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Text("Hello World"),
      ),
    ),
    ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child:
          FlutterLogo(style: FlutterLogoStyle.horizontal, colors: Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCarousel(),
          ),
          Container(
            height: 160.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Get Start"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("Sign In"),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return Stack(
      children: <Widget>[
        PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            itemCount: _pages.length),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: Colors.grey[800].withOpacity(0.5),
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: DotsIndicator(
                controller: _controller,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: _kDuration,
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selected;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
