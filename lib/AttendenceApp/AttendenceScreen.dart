import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:labtaskapp/AttendenceApp/myDropDownbutton.dart';
import 'package:http/http.dart' as http;

import 'TextFieldWidget.dart';
class AttendenceScreen extends StatefulWidget {
  AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  List<String> courses = [];
  List<String> sections = [];
  List<Map<String,dynamic>> StudList=[];
  List<Map<String,dynamic>> attendlist=[];
  List<bool> attendanceStatus = [];
  String? selectedCourse;
  String? selectedSection;
  String? coursemsg;
  String? sectionemsg;
  String?timetablemsg;
  String? attendancemsg;
  final String baseurl = "http://10.0.2.2:5000";
  TextEditingController day = TextEditingController();
  TextEditingController time = TextEditingController();
  Future<void> _getAllCourses() async {
    var response = await http.get(Uri.parse("${baseurl}/getCourses"));
    var msg = jsonDecode(response.body);
    print(msg);
    if (response.statusCode == 200) {
      courses = List<String>.from(msg.map((item) => item.toString()));
      print(courses);
      setState(() {});
    } else {
      coursemsg = msg;
      setState(() {});
    }
  }
  Future<void> _getAllSections() async {
    var response = await http.get(Uri.parse("${baseurl}/getSections"));
    var msg = jsonDecode(response.body);
    print(msg);
    if (response.statusCode == 200) {
      sections = List<String>.from(msg.map((item) => item.toString()));
      print(sections);
      setState(() {});
    } else {
      sectionemsg = msg;
      setState(() {});
    }
  }
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllCourses();
    _getAllSections();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(height: 10,),
        Row(
          children: [
            myDropDown(
              itemsList: courses,
              hint: "select course",
              width: 170,
              selecteditem: selectedCourse,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
            myDropDown(
              itemsList: sections,
              hint: "select Section",
              width: 170,
              selecteditem: selectedSection,
              onChanged: (value) {
                setState(() {
                  selectedSection = value;
                });
              },
            ),
          ],
        ),
        MyTextFieldWidget(label: "Day",c: day,),
        MyTextFieldWidget(label: "Time",c: time,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: ()async{
              var response=await http.post(Uri.parse("${baseurl}/getStudents"),body: jsonEncode({
                "course":selectedCourse,
                "section":selectedSection,
                "day":day.text,
                "time":time.text
              }),headers: {
                "Content-Type":"application/json"
              });
              var jsonresponse=jsonDecode(response.body);
              if (response.statusCode==200){
                StudList=jsonresponse.cast<Map<String, dynamic>>().toList();
                attendanceStatus = List<bool>.filled(StudList.length, false);
                setState(() {

                });
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonresponse)));
              }
              print(jsonresponse);
            }, child: Text("Fetch Students")),
            ElevatedButton(onPressed: ()async{
              attendlist.clear();

              for (int i = 0; i < StudList.length; i++) {
                attendlist.add({
                  "as_id": StudList[i]["as_id"],
                  "t_id": StudList[i]["t_id"],
                  "a_state": attendanceStatus[i] ==false ? 0: 1,
                });
              }
              var response=await http.post(Uri.parse("${baseurl}/markAttendence"),body: jsonEncode(attendlist),
               headers: {
                "Content-Type":"application/json"
              });
              var jsonresponse=jsonDecode(response.body);
              if (response.statusCode==200){
                attendancemsg=jsonresponse;
                setState(() {

                });
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonresponse)));
              }
              print(jsonresponse);
            }, child: Text("Mark Attendence")),
          ],
        ),
        Expanded(child: ListView.builder(
          itemCount: StudList.length,
          itemBuilder:(context,i){
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(StudList[i]["image"]),
                            radius: 30,
                          ),
                          Text(StudList[i]["Name"]),
                        ],
                      ),
                      Text(StudList[i]["Course"]),
                      Text(StudList[i]["Section"]),
                        ],
                      ),
                  Checkbox(value: attendanceStatus[i], onChanged: (value) {
                    setState(() {
                      attendanceStatus[i] = value!;
                    });
                  },),
                ],
              ),);
          }
        ))
      ],
    );
  }
}
