import 'package:day06_rsp_game/data/input_type.dart';
import 'package:day06_rsp_game/feature/input_card.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final bool isDone;

  final Function(InputType) callBack;

  final InputType? userInputType;

  const UserInput({
    required this.isDone,
    required this.callBack,
    this.userInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return resultUserBody();
    }
    return waitStateBody();
  }

  Widget resultUserBody() {
    return Row(
      children: [
        Expanded(child: SizedBox.shrink()),
        Expanded(child: InputCard(child: Image.asset(userInputType!.path))),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }

  Widget waitStateBody() {
    return Row(children: _getInput(callBack));
  }

  List<Widget> _getInput(Function(InputType) callBack) {
    return InputType.values
        .map(
          (type) => InputCard(
            callBack: () => callBack.call(type),
            child: Image.asset(type.path),
          ),
        )
        .toList();
  }
}
