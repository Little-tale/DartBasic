import 'package:fast_app_base/common/constants.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButton(
      {super.key, required this.isLike, required this.onTapLike});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  late SMIBool smiHover;

  // bool isLike = false;

  @override
  void initState() {
    // isLike = widget.isLike;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    // 빌드가 일어날때
    final isLike = widget.isLike;
    if (oldWidget.isLike != isLike) {
      smiPressed.value = isLike;
      smiHover.value = isLike;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like2.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          controller =
              StateMachineController.fromArtboard(art, 'State Machine 1')!;
          controller.isActive = true;
          art.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
        },
      ),
    );
  }
}
