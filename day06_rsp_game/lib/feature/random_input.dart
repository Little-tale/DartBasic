import 'package:day06_rsp_game/data/input_type.dart';
import 'package:day06_rsp_game/feature/input_card.dart';
import 'package:flutter/material.dart';

class RandomInput extends StatelessWidget {
  final bool isDone;
  final InputType? cpuInput;

  const RandomInput({required this.isDone, required this.cpuInput, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SizedBox.shrink()),
        Expanded(child: InputCard(child: getCpuInput())),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }

  Widget getCpuInput() {
    if (isDone) {
      return Image.asset(cpuInput?.path ?? "");
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      // padding: EdgeInsets.all(8),
      child: Text(
        "?",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
