import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labtaskapp/AttendenceApp/LoginScreen.dart';
import 'package:labtaskapp/GroceryApp/Home_screen.dart';
import 'package:labtaskapp/mamMOnaTask/TaskAPI/Posts.dart';
import 'package:labtaskapp/mamMOnaTask/leaveform/allLeaves.dart';
import 'Screens/Avatar_and_CameraImage/homeScree.dart';
import 'Screens/ContactBook/contactBookScreen/ShowContacts.dart';
import 'Screens/ParkingApp/parkingScreen.dart';
import 'Screens/StoreApp/Screens/ViewProductScreen.dart';
import 'mamMOnaTask/TASK2.dart';
import 'mamMOnaTask/TASK3.dart';
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Chess App")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            color: Colors.blueAccent,
            child: Text(
              "My second lab app with sir umer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(border: Border.all(), color: Colors.red),
            child: Text(
              "My second c2 lab app with sir umer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
