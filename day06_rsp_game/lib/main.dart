import 'package:day06_rsp_game/feature/game_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RSPGameApp());
}

class RSPGameApp extends StatelessWidget {
  const RSPGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RSPGameFrame());
  }
}

class RSPGameFrame extends StatelessWidget {
  const RSPGameFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RSP GAME")),
      body: GameBody(),
    );
  }
}
