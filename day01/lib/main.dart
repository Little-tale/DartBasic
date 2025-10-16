import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Flutter에서 머티리얼 디자인(Material Design)
  // 스타일의 앱을 만들 때 사용하는 상위 위젯
  // 앱 전체의 기본 설정과 전역 동작을 제공하는 역할함
  // home: Widget — 앱 시작화면 (예: Scaffold)
  // title: String — 앱 이름(플랫폼에 따라 사용)
  // theme: ThemeData — 앱 전체 테마
  // routes: Map<String, WidgetBuilder> — 정적 라우트 맵
  // initialRoute: String — 시작 라우트
  // onGenerateRoute: RouteFactory — 동적 라우팅 처리
  // debugShowCheckedModeBanner: bool — 디버그 배너 표시 여부
  runApp(MaterialApp(
    home: Scaffold(
      // 도화지
      appBar: TestAppBar(),
      body: CustomContainer(), // TestWidget(),
    ),
  ));
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // double.infinity, // 100,
      height: 300, // double.infinity, // 100,
      // color: const Color.fromARGB(255, 144, 218, 148), Decoration 이 있으면 Null 처리
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12), // Inner
      margin: const EdgeInsets.all(12), // Outer
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 144, 218, 148),
          border: Border.all(
              color: Colors.black, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 10)
          ]),
      child: const Center(
        child: Text(
          "이게 컨테이너다! 임마 알겠느으으으으으으으으 냐아아아아아아앙 크아아아아아아앙",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Quick Fix 단축키 -> cmd + . -> ANS = cmd + enter
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Hello Flutter",
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TestAppBar extends AppBar {
  // 머티리얼
  TestAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            '첫번째 Flutter App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print("Touch Top Button");
              },
            ),
          ],
        );
}
