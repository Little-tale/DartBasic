import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;

  const TossAppBar({super.key});

  @override
  State<TossAppBar> createState() => _TossAppBarState();
}

class _TossAppBarState extends State<TossAppBar> {
  bool _showRedDot = false;
  int _tappingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      height: TossAppBar.appBarHeight,
      child: Row(
        children: [
          _padding(10),
          AnimatedContainer(
            duration: 1000.n_ms,
            height: _tappingCount > 2 ? 60 : 30,
            curve: Curves.easeInOut,
            child: Image.asset(
              "$basePath/icon/toss.png",
              // height: 30,
            ),
          ),
          emptyExpanded,
          Image.asset(
            "$basePath/icon/map_point.png",
            height: 30,
          ).tap(onTap: () {
            setState(() {
              _tappingCount += 1;
            });
          }),
          _padding(10),
          Stack(
            children: [
              Image.asset(
                "$basePath/icon/notification.png",
                height: 30,
              ),
              if (_showRedDot)
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red[700]),
                  ),
                ))
            ],
          )
              .tap(onTap: () {
                setState(() {
                  // _showRedDot = !_showRedDot;
                  // 알림 화면 이동
                  Nav.push(const NotificationScreen());
                });
              })
              .animate()
              .shake(duration: 2000.ms, hz: 3),
          _padding(10),
        ],
      ),
    );
  }

  Widget _padding(double padding) {
    return const SizedBox(
      width: 10,
    );
  }
}
