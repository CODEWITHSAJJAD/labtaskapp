import 'package:flutter/material.dart';
class ColorChoice
{
  Color color;
  String name;
  ColorChoice({required this.color,required this.name});
}

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  List<ColorChoice> colorList=[
    ColorChoice(color: Colors.red, name: 'Red'),
    ColorChoice(color: Colors.blue, name: 'Blue'),
    ColorChoice(color: Colors.orange, name: 'Orange'),
  ];
  ColorChoice ? selectedChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedChoice==null?Colors.white:selectedChoice!.color,
      appBar: AppBar(title: Text('Color Selection'),backgroundColor: Colors.amber,),
      body: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Select Color',style: TextStyle(fontSize: 20),),
            DropdownButton<ColorChoice>(
                value: selectedChoice,
                items: colorList.map((ColorChoice colorChoiceObject){
                  return DropdownMenuItem<ColorChoice>(
                      value: colorChoiceObject,

                      child: Text(colorChoiceObject.name)
                  );

                }).toList(),

                onChanged: (ColorChoice ? val){
                  setState(() {
                    selectedChoice=val;
                  });
                })
          ],
        ),
      ),
    );
  }
}