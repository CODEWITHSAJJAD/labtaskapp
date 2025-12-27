import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'LoginScreen.dart';
class StudentDashboard extends StatefulWidget {
  String?name;
  StudentDashboard({super.key,required this.name});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  List<Map<String,dynamic>> Attendence = [];
  final String baseurl = "http://10.0.2.2:5000";
  Future<void> _getAttendence() async {
    var response = await http.post(Uri.parse("${baseurl}/getAttendence"),body: jsonEncode({
      "user":widget.name
    }),headers: {
      "Content-Type":"application/json"
    });
    if (response.statusCode==200){
      var jsonresponse=jsonDecode(response.body);
      Attendence=jsonresponse.cast<Map<String, dynamic>>().toList();
      setState(() {

      });
    }
  }
  @override
  @override
  void initState() {
    _getAttendence();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title:  Text('Student Dashboard'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }, icon: Icon(Icons.login,color: Colors.white,)),
        ],
      ),
      body: Column(
        children: [
          Text("Welcome ${widget.name}"),
          Expanded(child: ListView.builder(itemCount: Attendence.length,
              itemBuilder: (context,i){
            return Card(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("${Attendence[i]["course"]}"),
                        Text("${Attendence[i]["section"]}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("${Attendence[i]["attendance"]}"),
                        Text("${Attendence[i]["date"]}"),
                      ],
                    ),
                    ElevatedButton(onPressed: ()async{
                      var response=await http.post(Uri.parse("${baseurl}/addClaim"),body: jsonEncode({
                        "atten_id":Attendence[i]["atten_id"]
                      }),headers: {"Content-Type": "application/json"} );
                      var jsonresponse=jsonDecode(response.body);
                      if (response.statusCode==200){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonresponse)));
                        _getAttendence();
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonresponse)));
                      }

                    }, child: Text("Claim"))
                  ],
                ),
              ),
            );

              }
              )
          )
        ]
      )
    );
  }
}
