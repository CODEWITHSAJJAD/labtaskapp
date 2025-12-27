import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatelessWidget {
  TextEditingController Weight = TextEditingController();
  TextEditingController Height = TextEditingController();
  TextEditingController BMI = TextEditingController();
  BmiCalculatorScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator", style: TextStyle(color: Colors.white54)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: Weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Weight",
                labelText: "Enter Weigh",
              ),
            ),
            TextFormField(
              controller: Height,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Height",
                labelText: "Enter Height",
              ),
            ),
            TextFormField(
              controller: BMI,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "BMI",
                labelText: "BMI",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                double height=double.parse(Height.text);
                double weight=double.parse(Weight.text);
                double prod=weight/(height*height);
                BMI.text=prod.toString();
              },
              child: Text("Calculate"),
              style: ElevatedButton.styleFrom(
                maximumSize: Size(250, 50),
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
