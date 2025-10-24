import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterNextpage extends StatefulWidget {
  const RouterNextpage({super.key});

  @override
  State<RouterNextpage> createState() => _RouterNextpage();
}

class _RouterNextpage extends State<RouterNextpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("welcome Page"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
          child: const Text(" Go to Next2 "),
          onPressed: () => {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const NewPage2();
            //     },
            //   ),
            // )
            context.pushNamed('new1')
          },
        ),
        TextButton(
          child: const Text(" Go to Back "),
          onPressed: () => {
            // Navigator.pop(context)
            context.pop()
          },
        ),
      ]),
    );
  }
}

class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("welcome Page2"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(" Go to Back "),
              onPressed: () => {context.pop()},
            ),
            TextButton(
              child: const Text(" Go to Home "),
              onPressed: () => {
                // Navigator.popUntil(context, (route) => route.isFirst)
                context.goNamed('home')
              },
            ),
          ]),
    );
  }
}
