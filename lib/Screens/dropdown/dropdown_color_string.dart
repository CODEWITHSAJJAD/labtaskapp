import 'package:flutter/material.dart';
class DropDownColorExample1 extends StatefulWidget {
  const DropDownColorExample1({super.key});
  @override
  State<DropDownColorExample1> createState() => _DropDownColorExample1State();
}

class _DropDownColorExample1State extends State<DropDownColorExample1> {
  List<String> colors = [
    'Red', 'Green', 'Blue', 'Yellow','Orange','Purple','Pink','Brown','White'
  ];
  String selectedColorString='White';
  Color selectedColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(title: Text('Color Change App'),),
      body: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Select Color',style: TextStyle(fontSize: 20)),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(),

                  borderRadius: BorderRadius.circular(15)
              ),

              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(

                      isExpanded: true,
                      value: selectedColorString,
                      items: colors.map((String color){
                        return DropdownMenuItem(
                            value: color,
                            child: Text(color));
                      }).toList(),


                      onChanged: (String? color){
                        if(color==null){
                          return;
                        }
                        //    'Red', 'Green', 'Blue', 'Yellow','Orange','Purple','Pink','Brown','White'
                        if(color=='Red'){
                          selectedColor=Colors.red;
                        }
                        else if(color=='Green'){
                          selectedColor=Colors.green;
                        }
                        else if(color=='Blue'){
                          selectedColor=Colors.blue;
                        }
                        else if(color=='Yellow'){
                          selectedColor=Colors.yellow;
                        }
                        else if(color=='Orange'){
                          selectedColor=Colors.orange;
                        }
                        else if(color=='Purple'){
                          selectedColor=Colors.purple;
                        }
                        else if(color=='Pink'){
                          selectedColor=Colors.pink;
                        }
                        else if(color=='Brown'){
                          selectedColor=Colors.brown;
                        }
                        else if(color=='White'){
                          selectedColor=Colors.white;
                        }
                        selectedColorString=color;
                        setState(() {

                        });


                      }),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}