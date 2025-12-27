import 'package:flutter/material.dart';
import 'package:labtaskapp/Screens/AttendeceApp/Screens/newsession.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Welcome! Students')),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('New Session'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NewSessionScreen();
                }));
               // Navigator.pop(context);

              },
            )
          ],
        ),
      ),
    );
  }
}