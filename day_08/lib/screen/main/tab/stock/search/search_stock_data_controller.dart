import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockDataController>();
}

class SearchStockDataController extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', '엘지', '현대차', '넷플릭스']);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList =
        await LocalJson.getObjectList<SimpleStock>("json/stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }

    autoCompleteList.value =
        stocks.where((element) => element.name.contains(keyword)).toList();

    debugPrint(autoCompleteList.toString());
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String text) {
    searchHistoryList.remove(text);
  }
}
