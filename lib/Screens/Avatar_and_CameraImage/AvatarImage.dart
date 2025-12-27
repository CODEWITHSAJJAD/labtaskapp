import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
class MyAvatarImage extends StatefulWidget {
  const MyAvatarImage({super.key});

  @override
  State<MyAvatarImage> createState() => _MyAvatarImageState();
}

class _MyAvatarImageState extends State<MyAvatarImage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Avatar Image"),),
      body: Center(
        child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 80,
                backgroundImage:_image==null?null:FileImage(_image!) ,
              ),
              Positioned(
                left: 110,
                top: 110,
                child: GestureDetector(
                  child:Icon(Icons.camera_alt,size: 40,) ,
                  onTap: ()async{
                    ImagePicker picker=ImagePicker();
                    XFile? _pick=await picker.pickImage(source: ImageSource.camera);
                    if(_pick!=null){
                      setState(() {
                        _image=File(_pick.path);
                      });
                    }
                  },
                ),
              )

            ],
        ),
      ),
    );
  }
}
