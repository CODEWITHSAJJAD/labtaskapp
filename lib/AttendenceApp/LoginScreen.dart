import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:labtaskapp/AttendenceApp/TeacherDashboard.dart';

import 'StudentScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseurl = "http://10.0.2.2:5000";
  Map<String,dynamic> userobj={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
        children: [
          SizedBox(height: 40,),
          buildTextFormField(usernameController,"username"),
          SizedBox(height: 20,),
          buildTextFormField(passwordController,"password"),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            userobj={
              "user":usernameController.text,
              "pwd":passwordController.text,
            };
            var jsonuser=jsonEncode(userobj);
             var response=await http.post(Uri.parse("$baseurl/login"),body:jsonuser,headers: {'Content-Type': 'application/json'} );
             print(response.body);
             var msg=jsonDecode(response.body);
             print(msg);
             int role=msg["role"];
             print(role);
             if(response.statusCode==200){
               if (role==1){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherDashboard()));
               }
               else if(role==2){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDashboard(name: msg["username"],)));
               }
             }
             else if(response.statusCode==404){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
             }
             else{
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
             }

          }, child: Text("Login"))
        ],
      ),),
    );
  }

  TextFormField buildTextFormField(TextEditingController c,String hintText) {
    return TextFormField(
          controller:c ,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
  }
}
