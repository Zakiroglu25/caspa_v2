import 'package:caspa_v2/presentation/page/onboard_page/onboard_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImageAnimateRotate extends StatefulWidget {
  final Widget child;
  final int index;

  const ImageAnimateRotate({Key? key, required this.child, required this.index})
      : super(key: key);

  @override
  _ImageAnimateRotateState createState() => _ImageAnimateRotateState();
}

class _ImageAnimateRotateState extends State<ImageAnimateRotate>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
        upperBound: indexValueNotifier.value / 4,
        lowerBound: (indexValueNotifier.value - 1) / 4);
    //..forward(from: (widgets.index - 1) / 4);

    indexValueNotifier.addListener(() {
      forwardAnimation();
    });
  }

  void forwardAnimation() {
    _controller.forward(from: (indexValueNotifier.value - 1) / 4);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
