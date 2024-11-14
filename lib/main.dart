import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// StatelessWidget is immutable.
// if you declare a mutable variable inside s StatelessWidget
// you will see a warning saying statelesswidget is not meant to be changed.

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // StatelessWidget의 "build" method는
  // 코드 저장 / hot reload를 할 때마다
  // refresh 되어 개발할 때 편리하다.

  // intention action : put the cursor on the widget
  // and click light bulb
  // or alt + enter

  // if a variable is declared inside "build" function
  // the variable will keep being created every time app hot-reloads.
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          // Expanded Widget
          // Row에 넣으면 가로로 꽉 차고,
          // Column에 넣으면 세로로 꽉 찬다.
          // 한 개의 child만 가짐
          // flex 속성을 통해
          // sibling끼리 가로나 세로를 차지할 비율(ratio) 설정 가능
          // default는 1:1:1...
          Expanded(
            child: TextButton(
              onPressed: rollDicee,
              child: Image.asset('images/dice$leftDiceNumber.png'),
              style: TextButton.styleFrom(padding: EdgeInsets.all(16.0)),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: rollDicee,
              child: Image.asset('images/dice$rightDiceNumber.png'),
              style: TextButton.styleFrom(padding: EdgeInsets.all(16.0)),
            ),
          ),
        ],
      ),
    );
  }

  void rollDicee() {
    // without "setState()"
    // even if the variable `leftDiceNumber` changes
    // the UI will not change
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
