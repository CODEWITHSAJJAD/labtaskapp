import 'package:flutter/material.dart';
import 'package:labtaskapp/mamMOnaTask/leaveform/leaveclass.dart';
import 'package:labtaskapp/mamMOnaTask/leaveform/leaveform.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Allleaves extends StatefulWidget {
  Allleaves({super.key});

  @override
  State<Allleaves> createState() => _AllleavesState();
}

class _AllleavesState extends State<Allleaves> {
  List<Map<String, dynamic>> LeavesList = [];
  bool isfetching = true;
  final String url="http://10.0.2.2:2020";


  // Future<void> _getAllLeaves() async {
  //   LeavesList = await Leave.instance.getLeaves();
  //   isfetching = false;
  //   setState(() {});
  // }
  Future<void> _getAllLeaves() async {
    var Responce=await http.get(Uri.parse('${url}/getLeaves'));
    Responce.statusCode==200?LeavesList=List<Map<String,dynamic>>.from(json.decode(Responce.body)):print('error');
    print(LeavesList);
    isfetching = false;
    setState(() {});
  }

  @override
  void initState() {
    _getAllLeaves();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black45,
          backgroundColor: Colors.green,
          title: Text("Leaves",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),), centerTitle: true),
      floatingActionButton: FloatingActionButton(child: Text("+"),
          onPressed: ()async{
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaveForm()),
        );
        _getAllLeaves();
      }),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Unapproved Leaves",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            if (isfetching) Center(child: CircularProgressIndicator()) else Expanded(
                  child: ListView.builder(
                    itemCount: LeavesList.length,
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ListTile(
                          title: Text(LeavesList[i]['title']),
                          leading: LeavesList[i]["isApproved"]==1?Icon(Icons.check,color: Colors.green,):Icon(Icons.cancel,color: Colors.red,),
                          subtitle: Text("type:${LeavesList[i]['type']}\nDate:${LeavesList[i]['date']}\nStudent:${LeavesList[i]['student_name']}\nteacher:${LeavesList[i]['teacher_name']}\nComments:${LeavesList[i]['comments']}"),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
