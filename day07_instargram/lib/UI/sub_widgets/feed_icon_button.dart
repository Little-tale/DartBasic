import 'package:flutter/material.dart';

class FeedIconButton extends IconButton {
  const FeedIconButton({
    super.key,
    required super.onPressed,
    required super.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact, // 여백 컴팩트
      iconSize: 26,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: icon,
      splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
    );
  }
}
