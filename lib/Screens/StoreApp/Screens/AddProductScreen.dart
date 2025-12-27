import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<String> unit = ["kg", "ltr", "pcs"];
  List<String> category = ["Food", "Diary", "Electronics"];
  String? selectedUnit;
  String? selectedcategory;
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController company = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            textfields('Product Name', productName, TextInputType.text),
            SizedBox(height: 15,),
            textfields('Price', price, TextInputType.number),
            SizedBox(height: 15,),
            textfields('Company', company, TextInputType.text),
            SizedBox(height: 15,),

            Row(
                children: [
                  mydropdown("kg", unit, selectedUnit),
                  SizedBox(width: 31,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(90, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    onPressed: (){showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Add unit"),
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: "unit",
                          ),
                        ),actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Add unit"))
                      ],
                      );
                    });
                    },
                    child: Text("+",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            ]
            ),
            SizedBox(height: 15,),
            Row(
                children: [
                  mydropdown("Food", category, selectedcategory),
                  SizedBox(width: 31,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        minimumSize: Size(90, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),)
                    ),
                    onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Add Category"),
                          content: TextField(
                            decoration: InputDecoration(
                              hintText: "Category",
                            ),
                          ),actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Add Category"))
                        ],
                        );
                      });
                    },
                    child: Text("+",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                ]
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Add",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
    );
  }

  DropdownButtonHideUnderline mydropdown(
    String text,
    List<String> itemlist,
    String? valueString,
  ) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items:
            itemlist.map((String Col) {
              return DropdownMenuItem(value: Col, child: Text(Col));
            }).toList(),
        hint: Text(text),
        value: valueString,
        onChanged: (String? newvalue) {
          setState(() {
            valueString = newvalue;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 40,
          width: 250,
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blueAccent),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField textfields(
    String label,
    TextEditingController c,
    TextInputType t,
  ) {
    return TextFormField(
      controller: c,
      keyboardType: t,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(color: Colors.blueAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
