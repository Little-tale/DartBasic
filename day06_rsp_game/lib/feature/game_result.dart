import 'package:day06_rsp_game/data/game_result_type.dart';
import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final GameResultType? isUserWin;
  final VoidCallback resetCallBack;
  const GameResult({
    required this.isDone,
    super.key,
    this.isUserWin,
    required this.resetCallBack,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Center(
        child: Column(
          children: [
            Text(
              isUserWin?.text() ?? "",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => resetCallBack(),
              child: Text(
                "다시하기",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          '하나를 선택 하시오',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
