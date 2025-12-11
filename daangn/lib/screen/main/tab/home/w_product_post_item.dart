import 'dart:developer';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/s_post_detail.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductPostItemWidget extends StatelessWidget {
  final SimpleProductPostEntity productPostEntity;

  const ProductPostItemWidget(this.productPostEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        log("TAP_ ${productPostEntity.title}");
        Nav.push(PostDetailScreen(
          productPostEntity.id,
          simpleProductPost: productPostEntity,
        ));
      },
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: productPostEntity.product.images[0],
                  width: 150,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
              10.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productPostEntity.title.text.make(),
                    Row(
                      children: [
                        productPostEntity.address.simpleAddress.text
                            .color(context.appColors.lessImportantColor)
                            .make(),
                        '*'
                            .text
                            .color(context.appColors.lessImportantColor)
                            .make(),
                        timeago
                            .format(productPostEntity.createdAt,
                                locale: context.locale.languageCode)
                            .text
                            .make(),
                      ],
                    ),
                    productPostEntity.product.price.toWon().text.bold.make()
                  ],
                ),
              )
            ],
          ).p(15),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('$basePath/home/post_comment.png'),
                  productPostEntity.chatCount.text.make(),
                  Image.asset('$basePath/home/post_heart_off.png'),
                  productPostEntity.likeCount.text.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
