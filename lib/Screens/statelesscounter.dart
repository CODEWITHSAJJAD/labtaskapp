import 'package:flutter/material.dart';
class StlCOunterscreen extends StatelessWidget {

  const StlCOunterscreen({super.key});
  static int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: Text("Counter StateLess",style: TextStyle(fontSize: 34,color: Colors.white),),),
      body: Column(
        children: [
          Text("Counter:${_counter}"),
          ElevatedButton(onPressed: (){
            _counter++;
          }, child:Text("+"))
        ],
      ),
    );
  }
}
