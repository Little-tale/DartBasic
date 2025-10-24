import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/RouterNextPage.dart';

void main() {
  runApp(const MainApp());
}

final customTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.indigo,
    secondary: Colors.green,
    tertiary: Colors.yellow,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.amber,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/',
              name: 'home',
              builder: (context, _) => const RouterExampleWidget()),
          GoRoute(
              path: '/new',
              name: 'new',
              builder: (context, _) => const RouterNextpage(),
              routes: []),
          GoRoute(
              path: '/new1',
              name: 'new1',
              builder: (context, _) => const NewPage2())
        ],
      ),
      theme: customTheme,
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // navigation Stack index
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("화면이동"),
      ),
      body: homeBody(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        currentIndex: index,
        onTap: (newIndex) => setState(() {
          index = newIndex;
        }),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 1:
        return const Center(
          child: Icon(
            Icons.search,
            size: 100,
          ),
        );
      case 2:
        return const Center(
          child: Icon(
            Icons.person,
            size: 100,
          ),
        );
      case 0:
      default:
        return const Center(
          child: Icon(
            Icons.home,
            size: 100,
          ),
        );
    }
  }
}

class RouterExampleWidget extends StatefulWidget {
  const RouterExampleWidget({super.key});

  @override
  State<RouterExampleWidget> createState() => _RouterExampleWidgetState();
}

class _RouterExampleWidgetState extends State<RouterExampleWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Router 화면 이동"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: Text('Go Next', style: textTheme.bodyMedium),
              onPressed: () => {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const RouterNextpage();
                // }))
                context.pushNamed("new")
              },
            ),
            Text('$count넘버', style: textTheme.bodyMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            count += 1;
          })
        },
      ),
    );
  }
}
