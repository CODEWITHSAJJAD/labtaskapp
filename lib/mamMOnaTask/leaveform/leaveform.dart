import 'package:flutter/material.dart';
import 'package:labtaskapp/mamMOnaTask/leaveform/leaveclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaveForm extends StatefulWidget {
  LeaveForm({super.key});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController commentscontroller = TextEditingController();
  TextEditingController teachernamecontroller = TextEditingController();
  TextEditingController studentcontroller = TextEditingController();
  List<String> leavetypes = [
    "medical",
    "sick",
    "wedding",
    "family",
    "academic",
    "personal",
  ];
  String? selectedleavetype;
  final String url = "http://10.0.2.2:2020";
  Map<String, dynamic> leaves = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 2,
        shadowColor: Colors.black45,
        title: Text(
          "Leave Form",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(controller: datecontroller),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leave Type:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedleavetype,
                    items:
                        leavetypes
                            .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedleavetype = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Text(
              "Title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(controller: titlecontroller),
            SizedBox(height: 10),
            Text(
              "Comments:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(controller: commentscontroller),
            SizedBox(height: 10),
            Text(
              "Teacher name:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(controller: teachernamecontroller),
            SizedBox(height: 10),
            Text(
              "Student name:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(controller: studentcontroller),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    leaves = {
                      "date": datecontroller.text,
                      "student_name": studentcontroller.text,
                      "comments": commentscontroller.text,
                      "teacher_name": teachernamecontroller.text,
                      "title": titlecontroller.text,
                      "type": selectedleavetype!,
                      "isApproved": 0,
                    };
                    var leavesjson = jsonEncode(leaves);
                    // await Leave.instance.insertleave(
                    //   datecontroller.text,
                    //   studentcontroller.text,
                    //   commentscontroller.text,
                    //   teachernamecontroller.text,
                    //   titlecontroller.text,
                    //   selectedleavetype!,
                    //   true,
                    // );
                    var response = await http.post(
                      Uri.parse('${url}/InsertLeaves'),
                      body: leavesjson,
                      headers: {'Content-Type': 'application/json'},
                    );
                    var msg = jsonDecode(response.body);
                    if (response.statusCode == 201) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("${msg}")));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("${msg}")));
                    }
                    setState(() {});
                  },

                  child: Text("Submit"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
