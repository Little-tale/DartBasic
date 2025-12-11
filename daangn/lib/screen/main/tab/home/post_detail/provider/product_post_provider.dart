import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
# FutureProvider
비동기 작업(예: API 호출, DB, 파일 IO 등)을 다룰 때 쓰는 프로바이더.

# Family
Family가 붙으면 파라미터를 받을 수 있는 프로바이더가 되는 것.

# AutoDisposeFutureProviderFamily
파라미터를 받고, 자동으로 dispose되는 FutureProvider
*/

final productPostProvider =
    AutoDisposeFutureProviderFamily<ProductPostEntity, int>((ref, id) async {
  return await DaangnApi.getPost(id);
});
