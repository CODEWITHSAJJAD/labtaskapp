import 'package:flutter/material.dart';

class myGradeCalculator extends StatefulWidget {
  const myGradeCalculator({super.key});

  @override
  State<myGradeCalculator> createState() => _myRadioButtonState();
}

class _myRadioButtonState extends State<myGradeCalculator> {
TextEditingController Mycontrolller=new TextEditingController();
int ? crehr;
String? grade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Garde Calculator"),backgroundColor: Colors.blue,),
      body: calculatorview(),
    );
  }

  Padding calculatorview() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Obtained Marks"),
          TextFormField(
            controller:Mycontrolller ,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Row(
            children: [
              Radio(value: 3,
                groupValue: crehr,
                onChanged: (int? val){
                  setState(() {
                    crehr=val;
                  });
                },
              ),
              Text("3 CH",style: TextStyle(fontSize: 20),),
              SizedBox(width: 20,),
              Radio(value: 4,
                groupValue: crehr,
                onChanged: (int? val){
                  setState(() {
                    crehr=val;
                  });
                },
              ),
              Text("4 CH",style: TextStyle(fontSize: 20),)
            ]
          ),
          ElevatedButton(onPressed: (){
            if(crehr==null){
              return;
            }
            int marks=int.parse(Mycontrolller.text);
            if(crehr==3){
              if(marks>=48){
                grade="A";
              }
              else if(marks>=38){
                grade="B";
              }
              else if(marks>=28){
                grade="C";
              }
              else if(marks>=24){
                grade="D";
              }
              else{
                grade="F";
              }
            }else if(crehr==4){
              if(marks>=62){
                grade="A";
              }
              else if(marks>=50){
                grade="B";
              }
              else if(marks>=38){
                grade="C";
              }
              else if(marks>=28){
                grade="D";
              }
              else{
                grade="F";
              }
            }
            setState(() {

            });
          },child: Text("Calculate Grade"),),
          Text("Grade:${grade}")
        ],
      ),
    );
  }
}
