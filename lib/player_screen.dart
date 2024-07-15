import 'package:flutter/material.dart';
import 'package:practis4/xo_game.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player screen';
  String player1name = '';
  String player2name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text(
          'PLAYER SCREEN',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged: (text) {
              player1name = text;
            },
            decoration: InputDecoration(
                hintText: 'player 1 name', hintStyle: TextStyle(fontSize: 30)),
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            onChanged: (text) {
              player2name = text;
            },
            decoration: InputDecoration(
                hintText: 'player 2 name', hintStyle: TextStyle(fontSize: 30)),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, XoGame.routeName,
                    arguments: XoArgs(
                      player1name: player1name,
                      player2name: player2name,
                    ));
              },
              child: Text(
                "LET'S PLAY",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(169, 40, 164, 241))),
        ],
      ),
    );
  }
}
