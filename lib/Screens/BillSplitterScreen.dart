import 'package:flutter/material.dart';
class Billsplitterscreen extends StatelessWidget {
  TextEditingController totalbill = TextEditingController();
  TextEditingController totalpersons = TextEditingController();
  TextEditingController tip = TextEditingController();
  TextEditingController perPerson = TextEditingController();

  Billsplitterscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill Splitter", style: TextStyle(color: Colors.white54)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: totalbill,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Total Bill Amount",
                labelText: "Total Bill Amount",
              ),
            ),
            TextFormField(
              controller: totalpersons,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Total Persons",
                labelText: "Total Persons",
              ),
            ),
            TextFormField(
              controller: tip,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Tip Amount",
                labelText: "Tip Amount",
              ),
            ),
            TextFormField(
              controller: perPerson,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Per Person Amount",
                labelText: "Per Person Amount",
              ),
            ),
            ElevatedButton(onPressed: (){
              double totalBill=double.parse(totalbill.text);
              double persons=double.parse(totalpersons.text);
              double tipAmount=double.parse(tip.text);
              double perPersonAmount=(totalBill+tipAmount)/persons;
              perPerson.text=perPersonAmount.toString();

            },child: Text("Calculate"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,foregroundColor: Colors.white),)
          ],
        ),
      ),
    );
  }
}
