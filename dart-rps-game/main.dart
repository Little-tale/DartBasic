import 'dart:convert';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  // 1. 유저에게 어떤 타입을 낼 것인지 물어보는 질의 창
  final GameType user = askUserWhatType();

  // 2. 컴퓨터가 낼 타입 결정 (비동기)
  final GameType robot = await robotTurn();

  // 3. 유저의 타입과 컴퓨터 타입에 대한 결과 계산
  resultCalc(user, robot);
}

GameType askUserWhatType() {
  print("어떤 타입을 내시겠습니까? (가위, 바위, 보)");
  final String userInput = stdin.readLineSync(encoding: utf8) ?? 'Error';
  // 입력을 enum 값으로 변환 시도
  final GameType? chosen = GameType.fromText(userInput.trim());
  if (chosen == null) {
    print("알 수 없는 입력입니다: '$userInput' (가위, 바위, 보) 중에서 입력해주세요.");
    return askUserWhatType();
  } else {
    print("당신이 낸 타입: ${chosen.label} (${chosen.name})");
    return chosen;
  }
}

enum GameType {
  rock('바위'),
  paper('보'),
  scissors('가위');

  final String label;
  const GameType(this.label);

  /// label(한글)로부터 enum을 반환. 없으면 null.
  static GameType? fromText(String? label) {
    if (label == null) return null;
    final normalized = label.trim();

    for (final v in GameType.values) {
      if (v.label == normalized) return v;
    }

    switch (normalized.toLowerCase()) {
      case 'rock':
        return GameType.rock;
      case 'paper':
        return GameType.paper;
      case 'scissors':
        return GameType.scissors;
      default:
        return null;
    }
  }
}

Future<GameType> robotTurn() async {
  print("무엇을 낼지 고민 중입니다....");
  await Future.delayed(Duration(seconds: 1));
  final chosen = GameType.values[Random().nextInt(3)];
  print("로봇이 낸 타입: ${chosen.label} (${chosen.name})");
  return chosen;
}

void resultCalc(GameType user, GameType robot) {
  if (user == robot) {
    print("무승부입니다!");
  } else if ((user == GameType.rock && robot == GameType.scissors) ||
      (user == GameType.scissors && robot == GameType.paper) ||
      (user == GameType.paper && robot == GameType.rock)) {
    print("당신이 이겼습니다!");
  } else {
    print("로봇이 이겼습니다!");
  }
}
