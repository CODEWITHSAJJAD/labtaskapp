import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class MyCameraImage extends StatefulWidget {
  const MyCameraImage({super.key});

  @override
  State<MyCameraImage> createState() => _MyCameraImageState();
}

class _MyCameraImageState extends State<MyCameraImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        width: 400,
        child: Text("No Image"),
      ),
    );
  }
}
