import 'package:flutter/material.dart';
class MyTextFieldWidget extends StatelessWidget {
  String label;
  TextEditingController c;
  TextInputType ?t;
  Icon? pi;

  MyTextFieldWidget({required this.label, required this.c, this.t, this.pi});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: c,
        keyboardType: t,
        decoration: InputDecoration(
          prefixIcon: pi,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          // fillColor: Colors.white,
          // filled: true,
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
