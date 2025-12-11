import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/w_post_content.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/w_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:nav_hooks/dialog/hook_consumer_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostDetailScreen extends ConsumerWidget {
  final SimpleProductPostEntity? simpleProductPost;
  final int id;

  const PostDetailScreen(this.id, {super.key, this.simpleProductPost});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));
    return productPost.when(
      data: (data) => _PostDetail(
          simpleProductPost: data.simpleProductPost, productPost: data),
      error: (error, stack) => '에러발생 $error'.text.make(),
      loading: () => simpleProductPost != null
          ? _PostDetail(simpleProductPost: simpleProductPost!)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _PostDetail extends HookWidget {
  final SimpleProductPostEntity simpleProductPost;
  final ProductPostEntity? productPost;

  const _PostDetail({required this.simpleProductPost, this.productPost});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                _ImageIndicatorPager(
                  pageController: pageController,
                  simpleProductPost: simpleProductPost,
                ),
                UserProfileWidget(
                  user: simpleProductPost.product.user,
                  address: simpleProductPost.address,
                ),
                PostContentWidget(
                  simpleProductPost: simpleProductPost,
                  productPost: productPost,
                ),
              ],
            ),
          ),
          const _TopBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PostDetailBottomMenu(simpleProductPost.product),
          )
        ],
      ),
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  final ProductEntity product;

  const PostDetailBottomMenu(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      height: 100,
      child: Column(
        children: [
          const Line(),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  '$basePath/detail/heart_on.png',
                  height: 25,
                ).p(20),
                10.widthBox,
                const VerticalLine().pSymmetric(v: 15),
                20.widthBox,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          product.price.toWon().text.bold.make(),
                        ],
                      ),
                      '가격 제안하기'.text.orange400.underline.make()
                    ],
                  ),
                ),
                RoundButton(
                  text: '채팅하기 ',
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                ),
                10.widthBox,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ImageIndicatorPager extends StatelessWidget {
  const _ImageIndicatorPager({
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPostEntity simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      width: context.deviceWidth,
      child: Stack(
        children: [
          _ImagePager(
              pageController: pageController,
              simpleProductPost: simpleProductPost),
          _IndicatorWidget(
              pageController: pageController,
              simpleProductPost: simpleProductPost)
        ],
      ),
    );
  }
}

class _IndicatorWidget extends StatelessWidget {
  const _IndicatorWidget({
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPostEntity simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SmoothPageIndicator(
        effect: const SlideEffect(
            dotColor: Colors.white54, activeDotColor: Colors.black45),
        onDotClicked: (index) {},
        controller: pageController,
        count: simpleProductPost.product.images.length,
      ),
    );
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPostEntity simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: simpleProductPost.product.images
          .map((url) => CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.fill,
              ))
          .toList(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + context.statusBarHeight,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key? key,
    this.color,
    this.width = 1,
    this.margin,
  }) : super(key: key);

  final Color? color;
  final EdgeInsets? margin;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: color ?? context.appColors.divider,
      width: width,
    );
  }
}
