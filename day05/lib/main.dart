import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          TestCheckBox(),
          TestRadioButton(),
          TestSlider(),
          TestSwitch(),
          TestPopupMenu(),
          TestCallBackEventWidget(),
          ButtonExamplesWidget(),
          RandomWordsWidget(),
          ImageAssetsExampleWidget(),
        ],
      ),
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value ?? false)),
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value ?? false)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value ?? false)),
      ],
    );
  }

  void changeValue(int index, bool value) {
    setState(() {
      values[index] = value;
    });
  }
}

enum TestEnumValue { test1, test2, test3 }

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestEnumValue? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<TestEnumValue>(
              value: TestEnumValue.test1,
              groupValue: selectedValue,
              onChanged: (value) => setState(() => selectedValue = value),
            ),
            const Text("Test1")
          ],
        ),
        ListTile(
          leading: Radio<TestEnumValue>(
            value: TestEnumValue.test2,
            groupValue: selectedValue,
            onChanged: (value) => setState(() => selectedValue = value),
          ),
          title: Text(TestEnumValue.test2.name),
          onTap: () => setState(() => selectedValue = TestEnumValue.test2),
        ),
        Radio<TestEnumValue>(
          value: TestEnumValue.test3,
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = value),
        ),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${value.round()}'),
        Slider(
          value: value,
          divisions: 100,
          max: 100,
          min: 0,
          onChanged: (newValue) => setState(() => value = newValue),
          label: value.round().toString(),
          activeColor: Colors.red[300],
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
        ),
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestEnumValue selectedValue = TestEnumValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectedValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestEnumValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() => selectedValue = newValue),
        ),
      ],
    );
  }
}

class TestCallBackEventWidget extends StatefulWidget {
  const TestCallBackEventWidget({super.key});

  @override
  State<TestCallBackEventWidget> createState() =>
      _TestCallBackEventWidgetState();
}

class _TestCallBackEventWidgetState extends State<TestCallBackEventWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          'count : $value',
          style: const TextStyle(fontSize: 30),
        ),
        TestCallbackButton(addCountFunc),
      ]),
    );
  }

  void addCount() {
    setState(() => ++value);
  }

  void addCountFunc(int count) {
    setState(() => value += count);
  }
}

class TestCallbackButton extends StatelessWidget {
  const TestCallbackButton(this.function, {super.key});

  // final VoidCallback callBack; // callBack
  final void Function(int) function; // 함수방식

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        // onTap: callBack,
        onTap: () => function(1),
        customBorder: const StadiumBorder(), // ← 모양 기준
        child: Ink(
          // ← 여기다 데코를 줘야 잉크가 위에 그려짐
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: Colors.black),
            ),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text('UP UP UP'),
          ),
        ),
      ),
    );
  }
}

class ButtonExamplesWidget extends StatelessWidget {
  const ButtonExamplesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Text Button"),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
          OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton"))
        ],
      ),
    );
  }
}

class RandomWordsWidget extends StatefulWidget {
  const RandomWordsWidget({super.key});

  @override
  State<RandomWordsWidget> createState() => _RandomWordsWidgetState();
}

class _RandomWordsWidgetState extends State<RandomWordsWidget> {
  List<String> texts = [];

  @override
  Widget build(BuildContext context) {
    randomTexts();
    final widgets = texts
        .map((text) => Text(
              text,
              style: const TextStyle(fontSize: 20),
            ))
        .toList();

    return Column(
      children: [
        Column(
          children: widgets,
        ),
        ElevatedButton(
          onPressed: () => randomTexts(),
          child: const Text("랜덤 돌리기"),
        )
      ],
    );
  }

  void randomTexts() {
    final wordList = generateWordPairs()
        .take(5)
        .map((textModel) => textModel.asCamelCase)
        .toList();

    setState(() {
      texts = wordList;
    });
  }
}

class ImageAssetsExampleWidget extends StatelessWidget {
  const ImageAssetsExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/NASA3.jpg"),
    );
  }
}
