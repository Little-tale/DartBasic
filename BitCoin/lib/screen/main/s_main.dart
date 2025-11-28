import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  late final Stream<dynamic> stream;

  String priceString = 'Loading';
  final List<double> priceList = [];

  @override
  void initState() {
    stream = channel.stream;

    stream.listen((event) {
      // log(event);
      final decodedObj = json.decode(event);
      final double price = double.parse(decodedObj['p']);

      setState(() {
        priceString = price.toComma();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: extendBody, //bottomNavigationBar 아래 영역 까지 그림
      drawer: const MenuDrawer(),
      body: Container(
        color: context.appColors.seedColor.getMaterialColorValues[200],
        // padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
        child: SafeArea(
          // bottom: !extendBody,
          child: Center(
            child: priceString.text.size(50).make(),
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
