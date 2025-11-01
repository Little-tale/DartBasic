import 'package:flutter/material.dart';

class Tap extends StatelessWidget {
  final void Function() onTap;
  final void Function()? onLongPress;
  final Widget child;

  const Tap(
      {Key? key, required this.onTap, required this.child, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}

extension TapExt on Widget {
  Widget tap({
    required VoidCallback onTap,
    VoidCallback? onLongPress,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: behavior,
        onTap: onTap,
        onLongPress: onLongPress,
        child: this,
      ),
    );
  }
}
