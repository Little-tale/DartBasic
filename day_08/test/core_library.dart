// ignore_for_file: unused_local_variable

import 'dart:developer';

main() {
  String content = '라면 브랜드들 : '; // immutable -> 불변
  // 메모리낭비, 속도 저하
  var s = '';
  s += '라면';
  s += ' 브랜드들';

  // StringBuffer 생성
  final buffer = StringBuffer();

  // 문자열 붙이기
  buffer.write(content); // "라면 브랜드들"
  buffer.write('신라면'); // "라면 브랜드들 : 신라면"
  buffer.writeln(', 진라면'); // "라면 브랜드들 : 신라면, 진라면\n"
  buffer.writeln('불닭볶음면'); // 끝에 또 \n

  // 최종적으로 String 으로 꺼내기
  final result = buffer.toString();
  log(result);

  final regex = RegExp(r'\d+'); // 숫자 1개 이상 찾기
  const text = '라면 3개에 5000원';
  final match = regex.firstMatch(text); // 첫 번째 매치
  log(match?.group(0) ?? ""); // 3

  const text2 = '신라면 3개, 진라면 2개, 총 5개';
  final regex2 = RegExp(r'\d+'); // 숫자 덩어리(1개 이상)들 찾기

  final matches = regex2.allMatches(text2);

  for (final m in matches) {
    log(m.group(0) ?? ""); // 3, 2, 5
  }
}
