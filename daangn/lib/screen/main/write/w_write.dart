import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/s_post_detail.dart';
import 'package:fast_app_base/screen/main/write/d_select_image_source.dart';
import 'package:fast_app_base/screen/main/write/w_select_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final postProvider =
    StateProvider<List<SimpleProductPostEntity>>((ref) => postList);

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen>
    with KeyboardDetector {
  final List<String> imageList = [];

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    titleController.addListener(() {
      setState(() {});
    });
    priceController.addListener(() {
      setState(() {});
    });
    descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '내 물건 팔기'.text.bold.make(),
        actions: [Tap(onTap: () {}, child: '임시저장'.text.make().p(15))],
      ),
      body: Tap(
        onTap: () {
          AppKeyboardUtil.hide(context);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSelectWidget(
                imageList,
                onTapDeleteImage: (imagePath) {
                  setState(() {
                    imageList.remove(imagePath);
                  });
                },
                onTap: () async {
                  final selectedSource = await SelectImageSourceDialog().show();

                  if (selectedSource == null) {
                    return;
                  }
                  try {
                    final file =
                        await ImagePicker().pickImage(source: selectedSource);
                    if (file == null) {
                      return;
                    }
                    setState(() {
                      imageList.add(file.path);
                    });
                  } on PlatformException catch (e) {
                    switch (e.code) {
                      case 'invalid_image':
                        MessageDialog('지원하지 않는 이미지 형식입니다.').show();
                    }
                  } catch (e) {
                    //사진 권한이 필요해요 -> 앱 설정으로
                    log(e.toString());
                  }
                },
              ),
              _TitleEditor(titleController),
              30.heightBox,
              _PriceEditor(priceController),
              30.heightBox,
              _DescEditor(descriptionController),
            ],
          ).pSymmetric(h: 15),
        ),
      ),
      bottomSheet: isKeyboardOn
          ? null
          : _BottomRButton(
              isLoading: isLoading,
              isValid: isValid,
              onTap: () {
                final title = titleController.text;
                final price = priceController.text.isNumber()
                    ? int.parse(priceController.text)
                    : 0;
                final description = descriptionController.text;
                setState(() {
                  isLoading = true;
                });
                final list = ref.read(postProvider);
                final simpleProductPost = SimpleProductPostEntity(
                    6,
                    user3,
                    ProductEntity(
                      user3,
                      title,
                      price,
                      ProductStatus.normal,
                      imageList,
                    ),
                    title,
                    AddressEntity('서울시 다트구 플러터동', '플러터동'),
                    0,
                    0,
                    DateTime.now());
                ref.read(postProvider.notifier).state = List.of(list)
                  ..add(simpleProductPost);
                Nav.pop(context);
                Nav.push(
                  PostDetailScreen(
                    simpleProductPost.id,
                    simpleProductPost: simpleProductPost,
                  ),
                );
              }),
    );
  }

  bool get isValid =>
      isNotBlank(titleController.text) &&
      isNotBlank(priceController.text) &&
      isNotBlank(descriptionController.text);
}

class _BottomRButton extends StatelessWidget {
  final bool isLoading;
  final bool isValid;

  final VoidCallback onTap;

  const _BottomRButton(
      {required this.isLoading, required this.isValid, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Flutter 3.10 이상 바텀 SafeArea Bottom
    // systemGestureInsets

    return RoundButton(
      text: isLoading ? '저장중' : '작성 완료',
      isFullWidth: true,
      borderRadius: 6,
      isEnabled: isValid,
      rightWidget: isLoading
          ? const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(),
            ).pOnly(right: 80)
          : null,
      onTap: onTap,
    ).pOnly(bottom: context.viewGesturePaddingBottom);
  }
}

class _ImageSelectWidget extends StatelessWidget {
  final List<String> imageList;
  final VoidCallback onTap;
  final void Function(String path) onTapDeleteImage;

  const _ImageSelectWidget(
    this.imageList, {
    required this.onTap,
    required this.onTapDeleteImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SelectImageButton(onTap: onTap, imageList: imageList)
                .pOnly(top: 10, right: 8),
            ...imageList.map((imagePath) => Stack(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            File(imagePath),
                            fit: BoxFit.fill,
                          ).box.rounded.border(color: Colors.grey).make()),
                    ).pOnly(left: 4, right: 10, top: 10),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Tap(
                          onTap: () {
                            onTapDeleteImage(imagePath);
                          },
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: const Icon(Icons.add_circle),
                          ).pOnly(left: 30, bottom: 30),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  final TextEditingController controller;

  const _TitleEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '제목'.text.bold.make(),
        5.heightBox,
        TextField(
          controller: controller,
          decoration: const InputDecoration(
              hintText: '제목',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              ))),
        ),
      ],
    );
  }
}

class _PriceEditor extends StatefulWidget {
  final TextEditingController controller;

  const _PriceEditor(this.controller);

  @override
  State<_PriceEditor> createState() => _PriceEditorState();
}

class _PriceEditorState extends State<_PriceEditor> {
  bool isDonateMode = false;
  final priceNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '거래 방식'.text.bold.make(),
        Row(
          children: [
            RoundButton(
              text: '판매하기',
              theme: isDonateMode
                  ? RoundButtonTheme.whiteWithBlueBorder
                  : RoundButtonTheme.blue,
              onTap: () {
                widget.controller.clear();
                setState(() {
                  isDonateMode = false;
                });
                delay(() {
                  AppKeyboardUtil.show(context, priceNode);
                });
              },
            ),
            RoundButton(
                text: '나눔하기',
                theme: !isDonateMode
                    ? RoundButtonTheme.whiteWithBlueBorder
                    : RoundButtonTheme.blue,
                onTap: () {
                  widget.controller.text = "0";
                  setState(() {
                    isDonateMode = true;
                  });
                })
          ],
        ),
        5.heightBox,
        TextField(
          focusNode: priceNode,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          enabled: !isDonateMode,
          decoration: const InputDecoration(
              hintText: '￦ 가격을 입력해주세요.',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              ))),
        ),
      ],
    );
  }
}

class _DescEditor extends StatelessWidget {
  final TextEditingController controller;

  const _DescEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '자세한 설명'.text.bold.make(),
        5.heightBox,
        TextField(
          controller: controller,
          maxLines: 7,
          decoration: const InputDecoration(
              hintText: '에 올릴 게시글 내용을 작성해주세요.',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              ))),
        ),
      ],
    );
  }
}
