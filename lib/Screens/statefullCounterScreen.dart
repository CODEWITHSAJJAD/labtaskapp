import 'package:flutter/material.dart';
class stflCOunterScreen extends StatefulWidget {
  const stflCOunterScreen({super.key});

  @override
  State<stflCOunterScreen> createState() => _stflCOunterScreenState();
}

class _stflCOunterScreenState extends State<stflCOunterScreen> {
  static int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(backgroundColor: Colors.blueAccent,
        title: Text("Counter StateLess",style: TextStyle(fontSize: 34,color: Colors.white),),),
      body: Column(
        children: [
          Text("Counter:${_counter}"),
          ElevatedButton(onPressed: (){
            _counter++;
            setState(() {

            });
          }, child:Text("+"))
        ],
      ),
    );
  }
}
