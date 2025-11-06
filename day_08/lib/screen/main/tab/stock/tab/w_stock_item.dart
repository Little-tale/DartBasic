import 'package:fast_app_base/common/dart/extension/num_extension.dart';
import 'package:fast_app_base/common/widget/w_empty_expanded.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo.stock.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // const Width(10),
          Image.asset(
            stock.stockImagePath,
            width: 50,
          ),
          const Width(20),
          (stock.name).text.size(10).bold.make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              stock.todayPercentageString.text
                  .color(stock.priceColor(context))
                  .make(),
              "${stock.currentPrice.toComma()} 원".text.make(),
            ],
          )
        ],
      ),
    );
  }
}
