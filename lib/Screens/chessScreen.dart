import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  Widget rowBuilder(Color c1, Color c2) {
    return Row(
      children: [
        Container(height: 50,width:45,decoration: BoxDecoration(color: c1,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c2,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c1,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c2,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c1,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c2,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c1,border: Border.all()),),
        Container(height: 50,width: 45,decoration: BoxDecoration(color: c2,border: Border.all()),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Chess App")),
        backgroundColor: Colors.pinkAccent,

      ),
      body: Column(
        children: [
          rowBuilder(Colors.black, Colors.white),
          rowBuilder(Colors.white, Colors.black),
          rowBuilder(Colors.black, Colors.white),
          rowBuilder(Colors.white, Colors.black),
          rowBuilder(Colors.black, Colors.white),
          rowBuilder(Colors.white, Colors.black),
          rowBuilder(Colors.black, Colors.white),
          rowBuilder(Colors.white, Colors.black),
        ],
      ),
    );
  }
}
