import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'TextFieldWidget.dart';
import 'myDropDownbutton.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  List<String> courses = [];
  List<String> sections = [];
  String? selectedCourse;
  String? selectedSection;
  String? coursemsg;
  String? sectionemsg;
  File? _image;
  final String baseurl = "http://10.0.2.2:5000";
  TextEditingController Studname = TextEditingController();
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
    _getAllSections();
    _getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        spacing: 20,
        children: [
          myDropDown(
            itemsList: courses,
            hint: "select course",
            width: 250,
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
            width: 250,
            selecteditem: selectedSection,
            onChanged: (value) {
              setState(() {
                selectedSection = value;
              });
            },
          ),
          MyTextFieldWidget(label: "Enter Student reg no",c: Studname,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:_image==null?null:FileImage(_image!) ,
              ),
              IconButton(onPressed: ()async{
              ImagePicker picker=ImagePicker();
              XFile? _pick=await picker.pickImage(source: ImageSource.camera);
              if(_pick!=null){
                setState(() {
                  _image=File(_pick.path);
                });
              }}, icon: Icon(Icons.camera)),]
          ),
          ElevatedButton(
            onPressed: () async {
              print(selectedCourse.toString());
              print(selectedSection.toString());
              var jsondata = jsonEncode({
                "c_name": selectedCourse.toString(),
                "s_name": selectedSection.toString(),
                "username": Studname.text,
              });
            var request=  await http.MultipartRequest('POST',Uri.parse('${baseurl}/asignStudent'));
            request.fields['student']=jsondata;
            var imageFile= await http.MultipartFile.fromPath('Image', _image!.path);
           request.files.add(imageFile);
           var responseStream=request.send();
           var response=await http.Response.fromStream(await responseStream);
           print(response.statusCode==200);
           if(response.statusCode==200){
             _image==null;
             Studname.clear();
             selectedSection==null;
             selectedCourse==null;
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(response.body)),
             );
             setState(() {

             });
           }else{
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(response.body)));
           }

            },
            child: Text("Assign Student"),
          ),
        ],
      ),
    );
  }
}
