import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class ScrollingFabAnimation extends StatefulWidget {
  final GestureTapCallback? onPress;

  final double? elevation;
  final double? width;
  final double? height;
  final Duration? duration;
  final Widget? icon;
  final Widget? text;
  final Curve? curve;
  final ScrollController? scrollController;
  final double? limitIndicator;
  final Color? color;
  final bool? animateIcon;
  final bool? inverted;
  final double? radius;

  const ScrollingFabAnimation(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPress,
      required this.scrollController,
      this.elevation = 5.0,
      this.width = 120.0,
      this.height = 60.0,
      this.duration = const Duration(milliseconds: 250),
      this.curve,
      this.limitIndicator = 10.0,
      this.color,
      this.animateIcon = true,
      this.inverted = false,
      this.radius})
      : super(key: key);

  @override
  _ScrollingFabAnimatedState createState() => _ScrollingFabAnimatedState();
}

class _ScrollingFabAnimatedState extends State<ScrollingFabAnimation> {
  double _endTween = 100;

  @override
  void initState() {
    super.initState();
    if (widget.inverted!) {
      setState(() {
        _endTween = 0;
      });
    }
    _handleScroll();
  }

  @override
  void dispose() {
    widget.scrollController!.removeListener(() {});
    super.dispose();
  }
  void _handleScroll() {
    ScrollController _scrollController = widget.scrollController!;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > widget.limitIndicator! &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() {
          _endTween = widget.inverted! ? 100 : 0;
        });
      } else if (_scrollController.position.pixels <= widget.limitIndicator! &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        setState(() {
          _endTween = widget.inverted! ? 0 : 100;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.height! / 2))),
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _endTween),
          duration: widget.duration!,
          builder: (BuildContext _, double size, Widget? child) {
            double _widthPercent = (widget.width! - widget.height!).abs() / 100;
            bool _isFull = _endTween == 100;
            double _radius = widget.radius ?? (widget.height! / 2);
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                  color: widget.color ?? Theme.of(context).primaryColor),
              height: widget.height,
              width: widget.height! + _widthPercent * size,
              child: GestureDetector(
                onTap: widget.onPress,
                child: Ink(
                  child: Row(
                    mainAxisAlignment: _isFull
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Transform.rotate(
                            angle: widget.animateIcon!
                                ? (3.6 * math.pi / 180) * size
                                : 0,
                            child: widget.icon,
                          )),
                      ...(_isFull
                          ? [
                              Expanded(
                                child: AnimatedOpacity(
                                  opacity: size > 90 ? 1 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: widget.text!,
                                ),
                              )
                            ]
                          : []),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
