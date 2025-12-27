import 'package:flutter/material.dart';
import 'package:labtaskapp/Screens/Avatar_and_CameraImage/AvatarImage.dart';
class Homescree extends StatelessWidget {
  const Homescree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyAvatarImage();
              }));
            }, child:Text("Circular Avatar")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyAvatarImage();
              }));
            }, child:Text("Camera Image"))
        ],
      ),),
    );
  }
}
