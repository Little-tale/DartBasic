import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/benefits_dummy.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          bottom: MainScreenState.bottomNavigationBarHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Height(30),
          "혜택".text.white.bold.size(18).make(),
          const Height(30),
          const PointButton(point: 1000),
          const Height(20),
          "혜택 더 받기".text.white.bold.size(17).make(),
          ...benefitDummies
              .map((element) => BenefitItem(benefit: element))
              .toList()
        ],
      ).pSymmetric(h: 20),
    );
  }
}
