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

class DicePage extends StatelessWidget {
  // StatelessWidget의 "build" method는
  // 코드 저장 / hot reload를 할 때마다
  // refresh 되어 개발할 때 편리하다.
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
          Expanded(child: Image.asset('images/dice1.png')),
          Expanded(child: Image.asset('images/dice1.png')),
        ],
      ),
    );
  }
}
