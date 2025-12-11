import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>>
      getNotification() async {
    await sleepAsync(300.ms);
    return SimpleResult.success(notificationList);
  }

  static Future<ProductPostEntity> getPost(int id) async {
    await sleepAsync(500.ms);
    return ProductPostEntity(
      simpleProductPost: post1,
      content: '깨끗하게 썻어요.'
          '환불, 네고 불가합니다.'
          '사실 분만 연락하세요',
    );
  }
}
