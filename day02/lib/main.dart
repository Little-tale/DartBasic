import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Day 02'),
        backgroundColor: Colors.amber[300],
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      color: Colors.amber[100],
      child: StateWidgetExample(),
    );
  }
}

class ColumnWidgetExample extends StatelessWidget {
  const ColumnWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // 이친구가 수직방향 위짓들을 쌓음 뭔가 VStack 느낌?
      mainAxisAlignment: MainAxisAlignment.center, // 수직 방향 중앙 정렬
      crossAxisAlignment: CrossAxisAlignment.start, // 수평 방향 시작 정렬
      mainAxisSize: MainAxisSize.min, // 자식 위젯들이 가능한 최대 공간을 차지하도록 + min = 최소 공간
      children: [
        Container(
          width: 100,
          height: 80,
          child: Text("Container 1"),
          color: Colors.red[200],
        ),
        Container(
          width: 100,
          height: 80,
          child: Text("Container 2"),
          color: Colors.green[200],
        ),
        Container(
          width: 100,
          height: 80,
          child: Text("Container 3"),
          color: Colors.blue[200],
        ),
      ],
    );
  }
}

class RowWidgetExample extends StatelessWidget {
  const RowWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, // 수직 방향 중앙 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // 수평 방향 중앙 정렬
        mainAxisSize:
            MainAxisSize.max, // 자식 위젯들이 가능한 최대 공간을 차지하도록 + min = 최소 공간
        children: [
          Container(
            width: 100,
            height: 80,
            child: Text("Container 1"),
            color: Colors.red[200],
          ),
          Container(
            width: 100,
            height: 80,
            child: Text("Container 2"),
            color: Colors.green[200],
          ),
          Container(
            width: 100,
            height: 80,
            child: Text("Container 3"),
            color: Colors.blue[200],
          ),
        ]);
  }
}

class ColumnRowWidgetExample extends StatelessWidget {
  const ColumnRowWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center, // 수직 방향 중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 수평 방향 중앙 정렬
            mainAxisSize:
                MainAxisSize.max, // 자식 위젯들이 가능한 최대 공간을 차지하도록 + min = 최소 공간
            children: [
              Container(
                width: 100,
                height: 80,
                child: Text("Container 1"),
                color: Colors.red[200],
              ),
              Container(
                width: 100,
                height: 80,
                child: Text("Container 2"),
                color: Colors.green[200],
              ),
              Container(
                width: 100,
                height: 80,
                child: Text("Container 3"),
                color: Colors.blue[200],
              ),
            ]),
        Container(
          width: 300,
          height: 150,
          color: Colors.grey[400],
          child: Text("Container 4"),
        )
      ],
    );
  }
}

class ScrollWidgetExample extends StatelessWidget {
  const ScrollWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            margin: EdgeInsets.all(8),
          )
        ],
      ),
    );
  }
}

class RatioWidgetExample extends StatelessWidget {
  const RatioWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: double.infinity, height: 100, color: Colors.black),
        Expanded(
            // 남은 공간은 다 먹어치움 우선순위로 내가 짱임
            child: Container(
          color: Colors.blueGrey,
          height: 100,
        )),
        Flexible(
            // 자식에 의해 더 작아지거나 함 우선 자식부터 처리하고 나임
            flex: 1,
            child: Container(
              color: Colors.blueAccent,
              height: 100,
            )),
        Flexible(flex: 2, child: Container(color: Colors.redAccent)),
        Flexible(flex: 3, child: Container(color: Colors.greenAccent)),
        Flexible(flex: 4, child: Container(color: Colors.yellowAccent))
      ],
    );
  }
}

class StackWidgetExample extends StatelessWidget {
  const StackWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 500, height: 500, color: Colors.black),
        Container(width: 400, height: 400, color: Colors.red),
        Align(
            alignment: Alignment(0.5, 0.5),
            child: Container(width: 300, height: 300, color: Colors.green)),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(width: 200, height: 200, color: Colors.blue)),
      ],
    );
  }
}

class StackWidgetExample2 extends StatelessWidget {
  const StackWidgetExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(150)),
        ),
        Container(
          width: 290,
          height: 290,
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(145)),
        ),
        const Positioned.fill(
          child: Center(
            child: Text(
              'data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

/*
class ConstraintsWidgetExample extends StatelessWidget {
  const ConstraintsWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: 500,
        color: Colors.blue,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 150),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 120,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.green,
                  height: 120,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ));
  }
}
*/
// 위 코드는 정상 동작 안하는 이유

// 부모 컨테이너가 자식에게 500 이라는 타이트한제약
// 자식들도 영향
// 부모 제약을 느슨하게 해줘야함
class ConstraintsWidgetExample extends StatelessWidget {
  const ConstraintsWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.blue,
      alignment: Alignment.topCenter, // 해당 방법으로 느슨하게 해줘야함 탑 센터만 걸겠다.
      child: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 120,
                width: double.infinity,
                child: const Text("data"),
              ),
              Container(
                color: Colors.green,
                height: 120,
                width: double.infinity,
                child: const Text("data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Align(
          // Center 를 제공함으로써 제약 조건을 제공  -> Align 으로 어디에 위치할지 알려주기도
          alignment: Alignment.topRight,
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
        )
*/

class StateWidgetExample extends StatelessWidget {
  const StateWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StatelessWidgetExample(),
        StatefulWidgetExample(index: 3),
      ],
    );
  }
}

// Stateless
class StatelessWidgetExample extends StatelessWidget {
  const StatelessWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

// Stateful
class StatefulWidgetExample extends StatefulWidget {
  final int index;

  const StatefulWidgetExample({super.key, required this.index});

  @override
  State<StatefulWidgetExample> createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<StatefulWidgetExample> {
  late int _index;
  late TextEditingController textEditingController;

  @override
  void initState() {
    _index = widget.index;
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // 상태가 변했음을 상위에 알려야해!
            if (_index == 5) {
              _index = 1;
              return;
            }
            _index++;
          });
        },
        child: Container(
          color: Colors.blue[_index * 100],
          child: Center(child: Text("count $_index")),
        ),
      ),
    );
  }
}
