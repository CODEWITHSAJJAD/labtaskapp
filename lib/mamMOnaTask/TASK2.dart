import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class ContainerCustomizeTask extends StatefulWidget {
  ContainerCustomizeTask({super.key});

  @override
  State<ContainerCustomizeTask> createState() => _ContainerCustomizeTaskState();
}

class _ContainerCustomizeTaskState extends State<ContainerCustomizeTask> {
  List<String> Containers = ["Container1","Container2","Container3"];
  String? SelectedContainer;
  String? SelectedColor;
  String? Selectedheight;
  List<String> mColors=["green","blue","red"];
  List<String> Height=["100","200","300"];
  double h1=100;
  Color c1=Colors.blueGrey;
  double h2=100;
  Color c2=Colors.blueGrey;
  double h3=100;
  Color c3=Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customize Your Box"),backgroundColor: Colors.blueAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Container:"),
            SizedBox(height: 20,),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text("All"),
                items: Containers.map((String Cont) {
                  return DropdownMenuItem(value: Cont, child: Text(Cont));
                }).toList(),
                value: SelectedContainer,
                onChanged: (String? newValue) {
                  SelectedContainer = newValue!;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20,),
            Text("Select Color:"),
            SizedBox(height: 20,),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text("All"),
                items: mColors.map((String Col) {
                  return DropdownMenuItem(value: Col, child: Text(Col));
                }).toList(),
                value: SelectedColor,
                onChanged: (String? newValue) {
                  SelectedColor = newValue!;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20,),
            Text("Select Height:"),
            SizedBox(height: 20,),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text("All"),
                items: Height.map((String h) {
                  return DropdownMenuItem(value: h, child: Text(h));
                }).toList(),
                value: Selectedheight,
                onChanged: (String? newValue) {
                  Selectedheight = newValue!;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20,),
            Center(child: ElevatedButton(onPressed: (){
              if(SelectedContainer=="Container1"&&SelectedColor=="green"&&Selectedheight=="100") {
                h1 = 100;
                c1 = Colors.green;
              }
              else if(SelectedContainer=="Container1"&&SelectedColor=="blue"&&Selectedheight=="200") {
                h1 = 200;
                c1 = Colors.blue;
              }
              else if(SelectedContainer=="Container1"&&SelectedColor=="red"&&Selectedheight=="300") {
                h1 = 300;
                c1 = Colors.red;
              }
              else if(SelectedContainer=="Container2"&&SelectedColor=="blue"&&Selectedheight=="200") {
                h2 = 200;
              c2=Colors.blue;
              }
              else if(SelectedContainer=="Container2"&&SelectedColor=="green"&&Selectedheight=="100") {
                h2 = 100;
                c2 = Colors.green;
              }
              else if(SelectedContainer=="Container2"&&SelectedColor=="red"&&Selectedheight=="300") {
                h2 = 300;
                c2 = Colors.red;
              }
              else if(SelectedContainer=="Container3"&&SelectedColor=="red"&&Selectedheight=="300") {
                h3 = 300;
                c3 = Colors.red;
              }
              else if(SelectedContainer=="Container3"&&SelectedColor=="blue"&&Selectedheight=="200") {
                h3 = 200;
                c3=Colors.blue;
              }
              else if(SelectedContainer=="Container3"&&SelectedColor=="green"&&Selectedheight=="100") {
                h3 = 100;
                c3 = Colors.green;
              }
              setState(() {

              });
            }, child:Text("Apply Changes"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,foregroundColor: Colors.black),)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                  height: h1,
                  width: 100,
                  color: c1,
                ),
                Container(
                  height: h2,
                  width: 100,
                  color: c2,
                ),
                Container(
                  height: h3,
                  width: 100,
                  color: c3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
