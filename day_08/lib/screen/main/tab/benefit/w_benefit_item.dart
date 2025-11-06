import 'package:fast_app_base/common/constant/app_colors.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo_benefit.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;

  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          benefit.imagePath,
          width: 50,
          height: 50,
        ),
        const Width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            benefit.subTitle.text.size(13).make(),
            const Height(5),
            benefit.title.text.color(context.appColors.blueText).size(13).make()
          ],
        )
      ],
    ).pSymmetric(v: 20);
  }
}
