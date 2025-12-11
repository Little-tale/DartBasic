import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_simple_product_post.freezed.dart';

@freezed
class SimpleProductPostEntity with _$SimpleProductPostEntity {
  factory SimpleProductPostEntity(
    final int id,
    final UserEntity user,
    final ProductEntity product,
    final String title,
    final AddressEntity address,
    final int chatCount,
    final int likeCount,
    final DateTime createdAt,
  ) = _SimpleProductPostEntity;
}
