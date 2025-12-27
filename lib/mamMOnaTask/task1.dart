import 'package:flutter/material.dart';

class GRADEPercentage extends StatefulWidget {
  const GRADEPercentage({super.key});

  @override
  State<GRADEPercentage> createState() => _GRADEPercentageState();
}

class _GRADEPercentageState extends State<GRADEPercentage> {
  TextEditingController obm=new TextEditingController();
  TextEditingController tm=new TextEditingController();
  double percent=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Grade Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: obm,
              decoration: InputDecoration(
                hintText: "Enter your marks",
                labelText: "Enter Obtained Marks ",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                )
              ),
            ),
            TextFormField(
              controller: tm,
              onChanged: (value) {
                setState(() {
                  percent=-1;
                });
              },
              decoration: InputDecoration(
                  hintText: "Enter your marks",
                  labelText: "Enter Total Marks ",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                  )

              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                double ob=double.parse(obm.text);
                double t=double.parse(tm.text);
                percent=ob/t*100;

              });
            }, child: Text("Calculate Grade"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey,foregroundColor: Colors.white),),
            percent.isNegative?Text(""):Text("Your Percentage:$percent%"),
            Row(
              spacing: 20,
              children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: percent>90?Colors.green:Colors.blueGrey,
                    child: Center(child: Text("A")),
                  ),
                Container(
                  width: 50,
                  height: 50,
                  color: percent>70&&percent<90?Colors.yellow:Colors.blueGrey,
                  child: Center(child: Text("B")),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: percent>50&&percent<70?Colors.blueAccent:Colors.blueGrey,
                  child: Center(child: Text("C")),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: percent<50?Colors.redAccent:Colors.blueGrey,
                  child: Center(child: Text("D")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
