import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class ColorModel {
  final String colorName;
  final Color color;

  ColorModel({required this.colorName, required this.color});
}

class ColorSelectionDropDown extends StatefulWidget {
  const ColorSelectionDropDown({super.key});

  @override
  State<ColorSelectionDropDown> createState() => _ColorSelectionDropDownState();
}

class _ColorSelectionDropDownState extends State<ColorSelectionDropDown> {
  List<ColorModel> colors = [
    ColorModel(colorName: "Red", color: Colors.red),
    ColorModel(colorName: "Green", color: Colors.green),
    ColorModel(colorName: "Blue", color: Colors.blue),
    ColorModel(colorName: "Yellow", color: Colors.yellow),
    ColorModel(colorName: "Orange", color: Colors.orange),
    ColorModel(colorName: "Purple", color: Colors.purple),
    ColorModel(colorName: "Pink", color: Colors.pink),
    ColorModel(colorName: "Brown", color: Colors.brown),
    ColorModel(colorName: "Cyan", color: Colors.cyan),
    ColorModel(colorName: "Lime", color: Colors.lime),
    ColorModel(colorName: "Indigo", color: Colors.indigo),
    ColorModel(colorName: "Teal", color: Colors.teal),
    ColorModel(colorName: "Amber", color: Colors.amber),
    ColorModel(colorName: "Grey", color: Colors.grey),
    ColorModel(colorName: "Black", color: Colors.black),
    ColorModel(colorName: "White", color: Colors.white),
    ColorModel(colorName: "Deep Purple", color: Colors.deepPurple),
    ColorModel(colorName: "Deep Orange", color: Colors.deepOrange),
    ColorModel(colorName: "Light Blue", color: Colors.lightBlue),
    ColorModel(colorName: "Light Green", color: Colors.lightGreen),
    ColorModel(colorName: "Blue Grey", color: Colors.blueGrey),
    ColorModel(colorName: "Transparent", color: Colors.transparent),
  ];
  ColorModel? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: selectedColor?.color ?? Colors.blue,
        appBar: AppBar(
          title: Text("Color Selection Dropdown"),


        ),
        body: Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Select a Color:', style: TextStyle(fontSize: 20)),
              DropdownButtonHideUnderline(
                child: DropdownButton2<ColorModel>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(Icons.list, size: 20, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        'Select Color',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  items: colors
                      .map((item) =>
                      DropdownMenuItem<ColorModel>(
                        value: item,
                        child: Row(
                          children: [
                            //  Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              item.colorName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ))
                      .toList(),
                  value: selectedColor,
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.deepPurple),
                      color: Colors.deepPurple.shade50,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    elevation: 4,
                    offset: Offset(0, -5),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
