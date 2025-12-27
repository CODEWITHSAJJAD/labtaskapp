import 'package:flutter/material.dart';
class myListViewBuilder extends StatefulWidget {
  myListViewBuilder({super.key});

  @override
  State<myListViewBuilder> createState() => _myListViewBuilderState();
}

class _myListViewBuilderState extends State<myListViewBuilder> {
  List<String> mysub=["oop","pf","aict","ds","dsa","cv","nlp","dl","rl","ann"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Builder"),
      ),
      body: ListView.builder(
        itemCount: mysub.length,
          itemBuilder: (BuildContext context, int index){
          return ListTile(title: Text(mysub.elementAt(index)),leading: Icon(Icons.book),trailing: GestureDetector(child: Icon(Icons.delete),onTap:() {mysub.removeAt(index);setState(() {

          });},),);
      }),
    );
  }
}
