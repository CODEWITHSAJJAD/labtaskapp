import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  List<String> items = ['red', 'green', 'blue', 'yellow'];
  String? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Dorp Down"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Text("Selected Color:$selectedColor"),
          DropdownButton(
            items: items.map((String i) {
              return DropdownMenuItem(value: i, child: Text(i));
            }).toList(),
            onChanged: (String? value) {
              selectedColor = value;
              setState(() {

              });
            },
          ),
        ],
      ),
    );
  }
}
