import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:labtaskapp/AttendenceApp/myDropDownbutton.dart';

import 'TextFieldWidget.dart';
class AddCourSescreen extends StatefulWidget {
  const AddCourSescreen({super.key});

  @override
  State<AddCourSescreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourSescreen> {
  List<String> courses=[];
  List<String> sections=[];
  String?selectedCourse;
  String?selectedSection;
  String? coursemsg;
  String? sectionemsg;
  final String baseurl="http://10.0.2.2:5000";
  TextEditingController Cname=TextEditingController();
  TextEditingController Sname=TextEditingController();
  Future<void> _getAllCourses()async{
    var response=await http.get(Uri.parse("${baseurl}/getCourses"));
    var msg=jsonDecode(response.body);
    print(msg);
    if(response.statusCode==200){
      courses=List<String>.from(msg.map((item) => item.toString()));
      print(courses);
      setState(() {

      });
    }
    else{
      coursemsg=msg;
      setState(() {

      });
    }
  }
  Future<void> _getAllSections()async{
    var response=await http.get(Uri.parse("${baseurl}/getSections"));
    var msg=jsonDecode(response.body);
    print(msg);
    if(response.statusCode==200){
      sections=List<String>.from(msg.map((item) => item.toString()));
      print(sections);
      setState(() {

      });
    }
    else{
      sectionemsg=msg;
      setState(() {

      });
    }
  }
  @override
  @override
  void initState() {
    // TODO: implement initState
    _getAllSections();
    _getAllCourses();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30),
      child: Column(
        spacing: 20,
        children: [
          Row(
            children: [
              Expanded(
                child: myDropDown(itemsList: courses, hint: "select course", width: 250,selecteditem: selectedCourse,onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                }),
              ),
              IconButton(onPressed: ()async{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Course'),
                      content: MyTextFieldWidget(c: Cname,label: "Course Name",),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel',style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add', style: TextStyle(color: Colors.blue)),
                          onPressed: () async{
                            var jsondata=jsonEncode({
                              "c_name":Cname.text
                            });
                            var response=await http.post(Uri.parse("${baseurl}/addCourse"),headers: {'Content-Type': 'application/json'},body:jsondata );
                            var msg=jsonDecode(response.body);
                            if (response.statusCode==200){
                              _getAllCourses();
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );


              }, icon: Icon(Icons.add))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: myDropDown(itemsList: sections, hint: "select Section", width: 250,selecteditem: selectedSection,onChanged: (value){
                  setState(() {
                    selectedSection=value;
                  });
                },),
              ),
              IconButton(onPressed: ()async{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Section'),
                      content: MyTextFieldWidget(c: Sname,label: "Section Name",),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel',style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add', style: TextStyle(color: Colors.blue)),
                          onPressed: () async{
                            var jsondata=jsonEncode({
                              "s_name":Sname.text
                            });
                            var response=await http.post(Uri.parse("${baseurl}/addSection"),headers: {'Content-Type': 'application/json'},body:jsondata );
                            var msg=jsonDecode(response.body);
                            if (response.statusCode==200){
                              _getAllSections();
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );

              }, icon: Icon(Icons.add))
            ],
          ),
          ElevatedButton(onPressed: ()async{
            print(selectedCourse.toString());
            print(selectedSection.toString());
            var jsondata=jsonEncode({
              "c_name":selectedCourse.toString(),
              "s_name":selectedSection.toString()
            });
            var response=await http.post(Uri.parse("${baseurl}/asignCourseToSection"),headers: {'Content-Type': 'application/json'},body:jsondata );
            var msg=jsonDecode(response.body);
          }, child: Text("Assign Course"))
        ],
      ),
    );
  }
}
