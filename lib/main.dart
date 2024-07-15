import 'package:flutter/material.dart';
import 'package:practis4/player_screen.dart';
import 'package:practis4/xo_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PlayerScreen.routeName,
      routes: {
        PlayerScreen.routeName: (context) => PlayerScreen(),
        XoGame.routeName: (context) => XoGame(),
      },
    );
  }
}
