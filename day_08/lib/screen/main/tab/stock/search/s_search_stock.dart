import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data_controller.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_auto_complete_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> {
  late final SearchStockDataController searchData;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchData = Get.put(SearchStockDataController());
    controller.addListener(() {
      searchData.search(controller.text);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    Get.delete<SearchStockDataController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(controller: controller),
      body: Obx(
        () => searchData.autoCompleteList.isEmpty
            ? ListView(
                children: const [
                  SearchHistoryStockList(),
                  PopularSearchStockList(),
                ],
              )
            : SearchAutoCompleteList(controller),
      ),
    );
  }
}
