import 'package:flutter/material.dart';

class Rectanglebrust extends StatefulWidget {
  Rectanglebrust({super.key});

  @override
  State<Rectanglebrust> createState() => _RectanglebrustState();
}

class _RectanglebrustState extends State<Rectanglebrust> {
  double h = 100;
  double w = 200;
  Color c=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              h < 140 && w < 240
                  ? Container(height: h, width: w, color:c)
                  : Text("Rectangle brust"),
        
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        h += 5;
                        w += 5;
                        if(h==105&&w==205){c=Colors.blue;}
                        else if(h==105&&w==205){c=Colors.blueAccent;}
                        else if(h==110&&w==210){c=Colors.green;}
                        else if(h==115&&w==215){c=Colors.yellowAccent;}
                        else if(h==120&&w==220){c=Colors.redAccent;}
                        else if(h==125&&w==225){c=Colors.greenAccent;}
                        else if(h==130&&w==230){c=Colors.lightBlueAccent;}
                        else if(h==135&&w==235){c=Colors.lightBlue;}
                        else if(h==140&&w==240){c=Colors.lightGreen;}
        
                      });
                    },
                    child: Text("+"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (h > 100 && w > 100) {
                          h -= 5;
                          w -= 5;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
