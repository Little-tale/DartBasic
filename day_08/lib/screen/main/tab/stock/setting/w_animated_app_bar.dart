import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;

  const AnimatedAppBar(this.title, {super.key, required this.controller});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  final duration = 80.n_ms;
  double _scrollPosition = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        _scrollPosition = widget.controller.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => _scrollPosition > 80;

  double getValue(double initial, double target) {
    if (_scrollPosition <= 0) {
      return initial;
    }
    if (isTriggered) {
      return target;
    }

    final double fraction = (_scrollPosition / 80).clamp(0.0, 1.0).toDouble();
    return initial + (target - initial) * fraction;
  }

  double getTopValue() => _safeTop() + getValue(50, 15);

  double _safeTop() {
    final top = MediaQuery.viewPaddingOf(context).top;
    if (!top.isFinite || top < 0) {
      return 0;
    }
    return top;
  }

  @override
  Widget build(BuildContext context) {
    final safeTop = _safeTop();

    return Container(
      color: context.backgroundColor,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: safeTop),
            child: Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p20(),
          ),
          AnimatedContainer(
            duration: duration,
            padding:
                EdgeInsets.only(left: getValue(20, 50), top: getTopValue()),
            child: AnimatedDefaultTextStyle(
              duration: duration,
              style: TextStyle(
                  fontSize: !isTriggered ? 30 : 20,
                  fontWeight: FontWeight.bold),
              child: widget.title.text.make(),
            ),
          ),
        ],
      ),
    );
  }
}
