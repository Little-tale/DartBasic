import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notificationDummies = <NotificationObj>[
  NotificationObj(
    NotificationType.tossPay,
    '이번주에 중국집 어때요? 차이니즈 할인 쿠폰이 도착했어요',
    DateTime.now().subtract(27.minutes),
  ),
  NotificationObj(
    NotificationType.stock,
    '인적분할에 대해 알려드릴께요.',
    DateTime.now().subtract(1.hours),
  ),
  NotificationObj(
    NotificationType.walk,
    '1,000점을 이상 걸었다면 포인트를 받으시오',
    DateTime.now().subtract(8.hours),
  ),
  NotificationObj(
    NotificationType.moneyTip,
    '미국 주가가 크게 흔들리고 있어요.\n김재형님 Nvidia 주가를 매도할 타이밍!',
    DateTime.now().subtract(11.hours),
    isRead: true,
  ),
  NotificationObj(
    NotificationType.walk,
    '1,000걸음을 넘겼어요 포인트를 받으시오',
    DateTime.now().subtract(8.hours),
  ),
  NotificationObj(
    NotificationType.luck,
    '오늘의 행운 복권이 도착했어요',
    DateTime.now().subtract(12.hours),
    isRead: true,
  ),
  NotificationObj(
    NotificationType.people,
    '오늘의 공동구매 특가 보기',
    DateTime.now().subtract(27.minutes),
  ),
];
