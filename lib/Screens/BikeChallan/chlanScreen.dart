
import 'package:flutter/material.dart';
import 'package:labtaskapp/Screens/BikeChallan/voilationmodel.dart';

class listViewChalanScreen extends StatefulWidget {
  listViewChalanScreen({super.key});

  @override
  State<listViewChalanScreen> createState() => _listViewChalanScreenState();
}

class _listViewChalanScreenState extends State<listViewChalanScreen> {
  int fine=0;
  int totalvoilation=0;
  List<Voilationmodel> violationList=[
    Voilationmodel(name: "Signal", fine: 400),
    Voilationmodel(name: "Helmet", fine: 600),
    Voilationmodel(name: "Speed", fine: 700),
    Voilationmodel(name: "Number Plate", fine: 800),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bike Chalan') ,),
      body: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: violationList.length,
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        Checkbox(value: violationList[index].checked,
                            onChanged: (bool? val){
                              setState(() {
                                violationList[index].checked=val!;
                              });
                            }),
                        Text('${violationList[index].name} (Fine Rs ${violationList[index].fine})')
                      ],
                    );

                  }),
            ),
            ElevatedButton(onPressed: (){
              var chkList= violationList.where((elemet)=>elemet.checked);
              fine= chkList.map((item)=>item.fine).toList().reduce((a,b)=>a+b);
              totalvoilation=chkList.length;
              setState(() {

              });

            }, child: Text('Calculate')),
            Text('Total voilation ${totalvoilation}'),
            Text('Fine ${fine}')

          ],
        ),
      ),
    );
  }
}
