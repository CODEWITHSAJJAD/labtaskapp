import 'package:flutter/material.dart';
import 'package:labtaskapp/AttendenceApp/AddStudentScreen.dart';
import 'package:labtaskapp/AttendenceApp/AddTimeTableScreen.dart';
import 'package:labtaskapp/AttendenceApp/AttendenceScreen.dart';
import 'package:labtaskapp/AttendenceApp/LoginScreen.dart';

import 'AddCourseScreen.dart';
class TeacherDashboard extends StatefulWidget {
  TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final List<String> titles=["Add Course","Add Student","TimeTable","Attendence"];
  final List<Widget> Screens=[AddCourSescreen(),AddStudentScreen(),TimeTableScreen(),AttendenceScreen()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(titles[selectedIndex],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }, icon: Icon(Icons.login,color: Colors.white,)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Course",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Student",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: "TimeTable",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Attendence",
          ),
        ],
      ),
      body: Screens[selectedIndex],
    );
  }
}
