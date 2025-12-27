import 'package:flutter/material.dart';

import '../DB/db.dart';
import '../Models/sessionmodel.dart';

class NewSessionScreen extends StatefulWidget {
  const NewSessionScreen({super.key});

  @override
  State<NewSessionScreen> createState() => _NewSessionScreenState();
}

class _NewSessionScreenState extends State<NewSessionScreen> {
  TextEditingController sesssion=TextEditingController();
  SesssionModel? currentSession;
  void initState()
  {
    getSession();
  }
  Future<void> getSession()async
  {
  currentSession= await DBHelper.instance.getCurrentSession();
  setState(() {
    
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Session'),),
      body: Padding(padding: 
      EdgeInsets.all(15),
      child: Column(
        children: [
          currentSession==null?Text('No session '):Text(currentSession!.name),
          TextFormField(
            controller: sesssion,
          ),
          ElevatedButton(onPressed: ()async{
            
           int rowID= await DBHelper.instance.addNewSession(SesssionModel(id: 1,name: sesssion.text));
            if(rowID>0){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data Inserted'))

              );
            }
          }, child: Text('Add'))
        ],
      )),
    );
  }
}