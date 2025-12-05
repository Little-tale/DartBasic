import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_product_post.freezed.dart';

@freezed
class ProductPostEntity with _$ProductPostEntity {
  factory ProductPostEntity(
    final UserEntity user,
    final ProductEntity product,
    final String content,
    final AddressEntity address,
    final int chatCount,
    final int likeCount,
    final DateTime createdAt,
  ) = _ProductPostEntity;
}
