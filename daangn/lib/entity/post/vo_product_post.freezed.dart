// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_product_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPostEntity {
  SimpleProductPostEntity get simpleProductPost =>
      throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductPostEntityCopyWith<ProductPostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPostEntityCopyWith<$Res> {
  factory $ProductPostEntityCopyWith(
          ProductPostEntity value, $Res Function(ProductPostEntity) then) =
      _$ProductPostEntityCopyWithImpl<$Res, ProductPostEntity>;
  @useResult
  $Res call({SimpleProductPostEntity simpleProductPost, String content});

  $SimpleProductPostEntityCopyWith<$Res> get simpleProductPost;
}

/// @nodoc
class _$ProductPostEntityCopyWithImpl<$Res, $Val extends ProductPostEntity>
    implements $ProductPostEntityCopyWith<$Res> {
  _$ProductPostEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simpleProductPost = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      simpleProductPost: null == simpleProductPost
          ? _value.simpleProductPost
          : simpleProductPost // ignore: cast_nullable_to_non_nullable
              as SimpleProductPostEntity,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SimpleProductPostEntityCopyWith<$Res> get simpleProductPost {
    return $SimpleProductPostEntityCopyWith<$Res>(_value.simpleProductPost,
        (value) {
      return _then(_value.copyWith(simpleProductPost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductPostEntityImplCopyWith<$Res>
    implements $ProductPostEntityCopyWith<$Res> {
  factory _$$ProductPostEntityImplCopyWith(_$ProductPostEntityImpl value,
          $Res Function(_$ProductPostEntityImpl) then) =
      __$$ProductPostEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SimpleProductPostEntity simpleProductPost, String content});

  @override
  $SimpleProductPostEntityCopyWith<$Res> get simpleProductPost;
}

/// @nodoc
class __$$ProductPostEntityImplCopyWithImpl<$Res>
    extends _$ProductPostEntityCopyWithImpl<$Res, _$ProductPostEntityImpl>
    implements _$$ProductPostEntityImplCopyWith<$Res> {
  __$$ProductPostEntityImplCopyWithImpl(_$ProductPostEntityImpl _value,
      $Res Function(_$ProductPostEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simpleProductPost = null,
    Object? content = null,
  }) {
    return _then(_$ProductPostEntityImpl(
      simpleProductPost: null == simpleProductPost
          ? _value.simpleProductPost
          : simpleProductPost // ignore: cast_nullable_to_non_nullable
              as SimpleProductPostEntity,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductPostEntityImpl implements _ProductPostEntity {
  const _$ProductPostEntityImpl(
      {required this.simpleProductPost, required this.content});

  @override
  final SimpleProductPostEntity simpleProductPost;
  @override
  final String content;

  @override
  String toString() {
    return 'ProductPostEntity(simpleProductPost: $simpleProductPost, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPostEntityImpl &&
            (identical(other.simpleProductPost, simpleProductPost) ||
                other.simpleProductPost == simpleProductPost) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, simpleProductPost, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPostEntityImplCopyWith<_$ProductPostEntityImpl> get copyWith =>
      __$$ProductPostEntityImplCopyWithImpl<_$ProductPostEntityImpl>(
          this, _$identity);
}

abstract class _ProductPostEntity implements ProductPostEntity {
  const factory _ProductPostEntity(
      {required final SimpleProductPostEntity simpleProductPost,
      required final String content}) = _$ProductPostEntityImpl;

  @override
  SimpleProductPostEntity get simpleProductPost;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ProductPostEntityImplCopyWith<_$ProductPostEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
