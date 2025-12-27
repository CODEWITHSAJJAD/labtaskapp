import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class doctorApp extends StatefulWidget {
  const doctorApp({super.key});

  @override
  State<doctorApp> createState() => _doctorAppState();
}

class _doctorAppState extends State<doctorApp> {
  List<Map<String, dynamic>> Doctors = [
    {"name": "Dr.Ali", "Gender": "male", "Specialization": "heart", "Exp": 12},
    {"name": "Dr.Ahmad", "Gender": "male", "Specialization": "Neuro", "Exp": 4},
    {"name": "Dr.Afnan", "Gender": "male", "Specialization": "Neuro", "Exp": 6},
    {"name": "Dr.Wasay", "Gender": "male", "Specialization": "liver", "Exp": 7},
    {
      "name": "Dr.Saman",
      "Gender": "female",
      "Specialization": "heart",
      "Exp": 2,
    },
    {
      "name": "Dr.Sajjad",
      "Gender": "male",
      "Specialization": "psychology",
      "Exp": 1,
    },
    {
      "name": "Dr.Aleena",
      "Gender": "female",
      "Specialization": "liver",
      "Exp": 9,
    },
    {
      "name": "Dr.Alia",
      "Gender": "female",
      "Specialization": "lungs",
      "Exp": 8,
    },
  ];
  List<Map<String, dynamic>> FilterdDoctor = [];
  List<String> special = [
    "All",
    "heart",
    "Neuro",
    "liver",
    "lungs",
    "psychology",
  ];
  String? SelectedGender;
  String? SelectedSpecialization;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Doctor App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text("All"),
                items:
                    special.map((String Col) {
                      return DropdownMenuItem(value: Col, child: Text(Col));
                    }).toList(),
                value: SelectedSpecialization,
                onChanged: (String? newValue) {
                  SelectedSpecialization = newValue!;
                  print(SelectedSpecialization);
                  if(SelectedSpecialization == "All"&&SelectedGender == null){
                    FilterdDoctor = Doctors;
                  }
                  else{
                    FilterdDoctor=Doctors.where((element) =>
                    element["Specialization"].toString().toLowerCase() == SelectedSpecialization.toString().toLowerCase()&&element["Gender"].toString().toLowerCase() == SelectedGender.toString().toLowerCase()
                    ).toList();
                  }
                  setState(() {
                  });
                },
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: "male",
                      groupValue: SelectedGender,
                      onChanged: (String? newValue) {
                        SelectedGender = newValue!;
                        setState(() {});
                      },
                    ),
                    Text("Male"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "female",
                      groupValue: SelectedGender,
                      onChanged: (String? newValue) {
                        SelectedGender = newValue!;
                        setState(() {});
                      },
                    ),
                    Text("Female"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: FilterdDoctor.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green
                    ),
                    title: Text(FilterdDoctor[index]["name"]),
                    subtitle: Text(FilterdDoctor[index]["Specialization"]),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
