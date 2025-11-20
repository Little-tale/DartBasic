import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        const Height(20),
        getMyStocks(context),
      ],
    );
  }

  Widget getMyAccount(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Height(20),
            '계좌'.text.make(),
            Row(
              children: [
                '500원'.text.size(24).bold.make(),
                const Arrow(),
                emptyExpanded,
                RoundedContainer(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  backgroundColor: context.appColors.divider,
                  child: '체우기'.text.size(12).make(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Line(
                color: context.appColors.lessImportant,
              ),
            ),
            LongButton(
              title: '주문내역',
              onTap: () {},
            ),
            LongButton(
              title: '판매수익',
              onTap: () {},
            )
          ],
        ),
      );

  Widget getMyStocks(BuildContext context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: context.appColors.roundedLayoutBackground,
            child: Column(
              children: [
                const Height(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '관심주식'.text.bold.make(),
                    '편집하기'.text.bold.make(),
                  ],
                ),
                const Height(20),
                Tap(
                  onTap: () {
                    context.showSnackbar("asDASDAd");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '기본'.text.make(),
                        const Arrow(
                          direction: AxisDirection.up,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const InterestStockList().pSymmetric(h: 20),
        ],
      );
}
