import 'package:day07_instargram/UI/instar_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        ),
      ),
      home: InstarGramHome(),
    );
  }
}

class InstarGramHome extends StatefulWidget {
  const InstarGramHome({super.key});

  @override
  State<InstarGramHome> createState() => _InstarGramHomeState();
}

class _InstarGramHomeState extends State<InstarGramHome> {
  int index = 0;

  final _pages = const [
    _HomeTab(), // AppBar 있는 탭
    _SearchTab(), // AppBar 없는 탭
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (v) => setState(() => index = v),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 30),
        ),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.favorite_outline), onPressed: () => {}),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane),
            onPressed: () => {},
          ),
        ],
      ),
      body: const InstarBody(index: 0),
    );
  }
}

class _SearchTab extends StatelessWidget {
  const _SearchTab();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar 없음
      body: InstarBody(index: 1),
    );
  }
}
