import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:labtaskapp/Screens/ContactBook/DB/DB.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  File? imageFile;
  String? imgString;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<String> compressAndEncodeImage(File imageFile) async {
    // Read image bytes
    final bytes = await imageFile.readAsBytes();

    // Decode image
    img.Image? original = img.decodeImage(bytes);
    if (original == null) throw Exception("Failed to decode image");

    // Resize image to smaller width (e.g., 400 px)
    final resized = img.copyResize(original, width: 400);

    // Re-encode as JPEG with lower quality (0–100)
    final compressed = img.encodeJpg(resized, quality: 70);

    // Convert to Base64
    return base64Encode(compressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Contact",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.amber,
                  backgroundImage:
                      imageFile == null ? null : FileImage(imageFile!),
                ),
                Positioned(
                  left: 100,
                  top: 130,
                  child: GestureDetector(
                    child: Icon(Icons.camera_alt),
                    onTap: () async {
                      ImagePicker imgPicker = ImagePicker();
                      XFile? img = await imgPicker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (img != null) {
                        imageFile = File(img.path);
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                hint: Text("Enter Name"),
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.green[900]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusColor: Colors.green,
              ),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                prefix: Icon(Icons.phone),
                hint: Text("Enter Phone Number"),
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.green[900]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusColor: Colors.green,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefix: Icon(Icons.email_outlined),
                hint: Text("Enter Email"),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.green[900]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusColor: Colors.green,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                foregroundColor: Colors.amber,
              ),
              onPressed: addContact,
              child: Text("Add Contact"),
            ),
          ],
        ),
      ),
    );
  }

  void addContact() async {
    String name = nameController.text;
    String phone = phoneController.text;
    String? email;
    if (imageFile != null) {
      imgString = await compressAndEncodeImage(imageFile!);
    }
    if (!emailController.text.isEmpty) {
      email = emailController.text;
    }
    int id = await DBHelper.INSTANCE.insertRaw(name, phone, email, imgString);
    if (id > 0) {
      await DBHelper.INSTANCE.getContactsRaw();
      await ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Contact Added Successfully")));
      Navigator.pop(context);
    }
    setState(() {});
  }
}
