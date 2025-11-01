import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/d_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  final NotificationObj notificationObj;
  final VoidCallback onTap;

  const NotificationItemWidget(
      {super.key, required this.notificationObj, required this.onTap});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        color: widget.notificationObj.isRead
            ? context.backgroundColor
            : context.appColors.unReadColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notificationObj.type.iconPath,
                  width: iconWidth,
                ),
                widget.notificationObj.type.name.text
                    .size(12)
                    .color(context.appColors.lessImportantText)
                    .make(),
                emptyExpanded,
                timeago
                    .format(widget.notificationObj.time,
                        locale: context.locale.languageCode)
                    .text
                    .make(),
                const Width(10),
              ],
            ),
            widget.notificationObj.description.text
                .make()
                .pOnly(left: leftPadding + iconWidth)
          ],
        ),
      ),
    );
  }
}
