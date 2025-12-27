import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'TextFieldWidget.dart';
import 'myDropDownbutton.dart';
class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List<String> courses = [];
  List<String> sections = [];
  List<Map<String,dynamic>> timetable=[];
  String? selectedCourse;
  String? selectedSection;
  String? coursemsg;
  String? sectionemsg;
  String?timetablemsg;
  File? _image;
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
  Future<void> _getTimeTable() async{
    var response= await http.get(Uri.parse("${baseurl}/gettimetable"));
    var msg=jsonDecode(response.body);
    if (response.statusCode==200){
      timetable=msg.cast<Map<String, dynamic>>().toList();
      print(timetable);
      setState(() {
      });
    }
    else{
      timetablemsg=msg;
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
  void initState() {
    // TODO: implement initState
    _getAllSections();
    _getAllCourses();
    _getTimeTable();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 20,
        children: [
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
          ElevatedButton(
            onPressed: () async {
              _getTimeTable();
              print(selectedCourse.toString());
              print(selectedSection.toString());
              print(day.text);
              print(time.text);
              var jsondata = jsonEncode({
                "c_name": selectedCourse.toString(),
                "s_name": selectedSection.toString(),
                "day": day.text,
                "time":time.text
              });
              var response=await http.post(Uri.parse("${baseurl}/addTimeTable"),body: jsondata,headers: {
                "Content-Type":"application/json"
              });
              var msg=jsonDecode(response.body);
              print(response.statusCode==200);
              if(response.statusCode==200){
                _image==null;
                day.clear();
                time.clear();
                selectedSection==null;
                selectedCourse==null;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg)),
                );
                setState(() {

                });
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(response.body)));
              }

            },
            child: Text("Add"),
          ),
          Text("TimeTable"),
          Expanded(child: ListView.builder(itemCount: timetable.length,
            itemBuilder: (context,i){
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timetable[i]["course"]),
                      Text(timetable[i]["section"]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timetable[i]["day"]),
                      Text(timetable[i]["time"]),
                    ],
                  ),

                ]
              ),
            );
          },
          ))

        ],
      ),
    );
  }
}
