const assetPath = 'assets/';

enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}
