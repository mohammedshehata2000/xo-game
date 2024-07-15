import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function onPrised;

  int index;

  Button({required this.text, required this.onPrised, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {
            onPrised(index);
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 70, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(174, 3, 70, 225)),
        ),
      ),
    );
  }
}
