import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data_controller.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_detail.dart';
import 'package:flutter/material.dart';

class SearchAutoCompleteList extends StatelessWidget
    with SearchStockDataProvider {
  final TextEditingController controller;

  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchData.autoCompleteList.length,
        itemBuilder: (context, index) => listItem(index));
  }

  Widget listItem(int index) {
    final stock = searchData.autoCompleteList[index];
    return Tap(
        onTap: () {
          controller.clear();
          searchData.addHistory(stock);
          Nav.push(StockDetailScreen(
            stockName: stock.name,
          ));
        },
        child: stock.name.text.make().p(20));
  }
}
