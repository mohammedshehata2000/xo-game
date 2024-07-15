import 'package:flutter/material.dart';
import 'package:practis4/button.dart';

class XoGame extends StatefulWidget {
  static const String routeName = 'xoGame';

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  List<String> buttonText = ['', '', '', '', '', '', '', '', ''];
  int player1score = 0;

  int player2score = 0;

  @override
  Widget build(BuildContext context) {
    XoArgs args = ModalRoute.of(context)?.settings.arguments as XoArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(186, 42, 222, 22),
        centerTitle: true,
        title: Text(
          'XO GAME',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1name}(X) ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$player1score',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2name}(O) ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$player2score',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: buttonText[0],
                  index: 0,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[1],
                  index: 1,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[2],
                  index: 2,
                  onPrised: onClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: buttonText[3],
                  index: 3,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[4],
                  index: 4,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[5],
                  index: 5,
                  onPrised: onClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: buttonText[6],
                  index: 6,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[7],
                  index: 7,
                  onPrised: onClicked,
                ),
                Button(
                  text: buttonText[8],
                  index: 8,
                  onPrised: onClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onClicked(int index) {
    if (buttonText[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      buttonText[index] = 'X';
    } else {
      buttonText[index] = 'O';
    }
    counter++;
    if (winState('X')) {
      player1score += 5;
      inti();
    } else if (winState('O')) {
      player2score += 5;
      inti();
    } else if (counter == 9) {
      inti();
    }

    setState(() {});
  }

  bool winState(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (buttonText[i] == symbol &&
          buttonText[i + 1] == symbol &&
          buttonText[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (buttonText[i] == symbol &&
          buttonText[i + 3] == symbol &&
          buttonText[i + 6] == symbol) {
        return true;
      }
    }

    if (buttonText[0] == symbol &&
        buttonText[4] == symbol &&
        buttonText[8] == symbol) {
      return true;
    }

    if (buttonText[2] == symbol &&
        buttonText[4] == symbol &&
        buttonText[6] == symbol) {
      return true;
    }

    return false;
  }

  void inti() {
    buttonText = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }
}

class XoArgs {
  String player1name;

  String player2name;

  XoArgs({required this.player1name, required this.player2name});
}
