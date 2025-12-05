import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/300';
}

final user1 = UserEntity(
  id: 1,
  nickname: '홍길동',
  profileUrl: picSum(403),
  temperature: 36.5,
);

final user2 = UserEntity(
  id: 2,
  nickname: '김유신',
  profileUrl: picSum(400),
  temperature: 36.5,
);

final user3 = UserEntity(
  id: 3,
  nickname: '고길동',
  profileUrl: picSum(500),
  temperature: 36.5,
);

final product1 = ProductEntity(
  user1,
  'iPhone18',
  1400000,
  "미개봉 새상품",
  ProductStatus.normal,
  [
    picSum(100),
    picSum(101),
    picSum(102),
  ],
);

final product2 = ProductEntity(
  user2,
  'ToppingOTG 2x2',
  200000,
  "잠깐 방송하다가 팔아요... 택포가격입니다.",
  ProductStatus.normal,
  [
    picSum(100),
    picSum(101),
    picSum(102),
  ],
);

final product3 = ProductEntity(
  user3,
  '무료나눔',
  0,
  "직거래만 받아요",
  ProductStatus.normal,
  [
    picSum(100),
    picSum(101),
    picSum(102),
  ],
);

final post1 = ProductPostEntity(
  product1.user,
  product1,
  'asasdasd',
  AddressEntity(
    "서울시 행복구 축하동 132길 132",
    "서울시",
  ),
  30,
  120,
  DateTime.now().subtract(30.minutes),
);

final post2 = ProductPostEntity(
  product2.user,
  product2,
  'ㅎㄷ',
  AddressEntity(
    "서울시 행복구 축하동 132길 132",
    "서울시",
  ),
  30,
  120,
  DateTime.now().subtract(20.minutes),
);

final post3 = ProductPostEntity(
  product3.user,
  product3,
  '12ㅎㄴㅌ',
  AddressEntity(
    "서울시 행복구 축하동 132길 132",
    "서울시",
  ),
  30,
  120,
  DateTime.now().subtract(10.minutes),
);

final postList = [
  post1,
  post2,
  post3,
  post1,
  post2,
  post3,
  post1,
  post2,
  post3
];
