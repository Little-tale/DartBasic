import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_product_post.freezed.dart';

@freezed
class ProductPostEntity with _$ProductPostEntity {
  const factory ProductPostEntity({
    required SimpleProductPostEntity simpleProductPost,
    required String content,
  }) = _ProductPostEntity;
}
