import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_address.freezed.dart';

@freezed
class AddressEntity with _$AddressEntity {
  factory AddressEntity(
    final String fullAddress,
    final String simpleAddress,
  ) = _AddressEntity;
}
