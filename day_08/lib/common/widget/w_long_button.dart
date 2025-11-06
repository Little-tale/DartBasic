import 'package:flutter/material.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';

class LongButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LongButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.make(),
        emptyExpanded,
        Arrow(
          color: context.appColors.lessImportant,
        )
      ],
    ).tap(onTap: onTap);
  }
}
