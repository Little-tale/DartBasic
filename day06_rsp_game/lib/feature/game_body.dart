import 'dart:math';

import 'package:day06_rsp_game/data/game_result_type.dart';
import 'package:day06_rsp_game/data/input_type.dart';
import 'package:day06_rsp_game/feature/game_result.dart';
import 'package:day06_rsp_game/feature/random_input.dart';
import 'package:day06_rsp_game/feature/user_input.dart';
import 'package:flutter/material.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  InputType? _cpuInput;
  GameResultType? _result;

  @override
  void initState() {
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RandomInput(isDone: isDone, cpuInput: _cpuInput),
        ),
        Expanded(
          child: GameResult(
            isDone: isDone,
            isUserWin: _result,
            resetCallBack: reset,
          ),
        ),
        Expanded(
          child: UserInput(
            isDone: isDone,
            callBack: setUserInput,
            userInputType: _userInput,
          ),
        ),
      ],
    );
  }

  void setUserInput(InputType type) {
    setState(() {
      setCpuInput();
      _userInput = type;
      calcResult();
      isDone = true;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  void calcResult() {
    if (_userInput != null && _cpuInput != null) {
      switch (_userInput!) {
        case InputType.rock:
          switch (_cpuInput!) {
            case InputType.rock:
              _result = GameResultType.draw;
            case InputType.scissors:
              _result = GameResultType.win;
            case InputType.paper:
              _result = GameResultType.defeat;
          }
        case InputType.scissors:
          switch (_cpuInput!) {
            case InputType.rock:
              _result = GameResultType.defeat;
            case InputType.scissors:
              _result = GameResultType.draw;
            case InputType.paper:
              _result = GameResultType.win;
          }
        case InputType.paper:
          switch (_cpuInput!) {
            case InputType.rock:
              _result = GameResultType.win;
            case InputType.scissors:
              _result = GameResultType.defeat;
            case InputType.paper:
              _result = GameResultType.draw;
          }
      }
    }
  }

  void reset() {
    setState(() {
      _userInput = null;
      _cpuInput = null;
      _result = null;
      isDone = false;
    });
  }
}
