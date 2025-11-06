import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedLayoutBackground,
          pinned: true,
          actions: [
            ImageButton(
              callback: () {
                Nav.push(SearchStockScreen());
              },
              imagePath: '$basePath/icon/stock_search.png',
            ),
            ImageButton(
              callback: () {},
              imagePath: '$basePath/icon/stock_calendar.png',
            ),
            ImageButton(
              callback: () {},
              imagePath: '$basePath/icon/stock_settings.png',
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              if (currentIndex == 0)
                MyStockFragment()
              else
                TodaysDiscoveryFragment()
            ],
          ),
        )
      ],
    );
  }

  // 임시
  Widget get title => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '토스증권'.text.size(24).bold.make(),
            const Width(20),
            'S&P 500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            const Width(10),
            3919.29
                .toComma()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make()
          ],
        ).pOnly(left: 20),
      );
  Widget get tabBar => Container(
        child: Column(
          children: [
            TabBar(
                onTap: (value) => {
                      setState(() {
                        currentIndex = value;
                      })
                    },
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelPadding: const EdgeInsets.symmetric(vertical: 20),
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: [
                  '내 주식'.text.make(),
                  '오늘의 발견'.text.make(),
                ]),
            const Line()
          ],
        ),
      );
}
