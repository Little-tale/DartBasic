enum GameResultType { win, draw, defeat }

extension GameResultExtension on GameResultType {
  String text() {
    switch (this) {
      case GameResultType.win:
        return '승리';
      case GameResultType.draw:
        return '무승부';
      case GameResultType.defeat:
        return '패배';
    }
  }
}
