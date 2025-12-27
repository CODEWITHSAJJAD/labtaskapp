import 'package:flutter/material.dart';

class Calculatorscreen extends StatelessWidget {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  TextEditingController result = TextEditingController();
  Calculatorscreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator", style: TextStyle(color: Colors.white54)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: firstNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter first number",
                labelText: "First Number",
              ),
            ),
            TextFormField(
              controller: secondNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Second number",
                labelText: "Second Number",
              ),
            ),
            TextFormField(
              controller: result,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Result",
                labelText: "Result",
              ),
            ),
            Row(
              spacing: 30,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double sum=double.parse(firstNumber.text)+double.parse(secondNumber.text);
                    result.text=sum.toString();
                  },
                  child: Text("+"),
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(250, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double minus=double.parse(firstNumber.text)-double.parse(secondNumber.text);
                  result.text=minus.toString();},
                  child: Text("-"),
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(150, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 30,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double prod=double.parse(firstNumber.text)*double.parse(secondNumber.text);
                    result.text=prod.toString();
                  },
                  child: Text("*"),
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(250, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double div=double.parse(firstNumber.text)/double.parse(secondNumber.text);
                  result.text=div.toString();},
                  child: Text("/"),
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(150, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
