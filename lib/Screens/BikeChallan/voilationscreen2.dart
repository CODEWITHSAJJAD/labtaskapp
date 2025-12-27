import 'package:flutter/material.dart';

class VoilationScreen2 extends StatefulWidget {
  const VoilationScreen2({super.key});

  @override
  State<VoilationScreen2> createState() => _VoilationScreen2State();
}

class _VoilationScreen2State extends State<VoilationScreen2> {
  List<Map<String, dynamic>> voilationList = [
    {"checked": false, "amount": 400},
    {"checked": false, "amount": 500},
    {"checked": false, "amount": 600},
    {"checked": false, "amount": 400},
  ];

  int _voilationCount = 0;
  int _challanAmount = 0;
  void signalVoilated(bool? val) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Challan Mangement'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),

        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: voilationList[0]["checked"],
                  onChanged: (bool? value) {
                    voilationList[0]["checked"] = value!;
                    setState(() {});
                  },
                ),
                Text('Signal (Fine Rs 400)'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: voilationList[1]["checked"],
                  onChanged: (bool? value) {
                    voilationList[1]["checked"] = value!;
                    setState(() {});
                  },
                ),
                Text('Helmet (Fine Rs 500)'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: voilationList[2]["checked"],
                  onChanged: (bool? value) {
                    voilationList[2]["checked"] = value!;
                    setState(() {});
                  },
                ),
                Text('Speed (Fine Rs 600)'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: voilationList[3]["checked"],
                  onChanged: (bool? value) {
                    voilationList[3]["checked"] = value!;
                    setState(() {});
                  },
                ),
                Text('Number Plate (Fine Rs 400)'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _voilationCount = _challanAmount = 0;
                var checkedList = voilationList
                    .where((element) => element["checked"])
                    .toList();
                _voilationCount = checkedList.length;
                for (int i = 0; i < checkedList.length; i++) {
                  _challanAmount += int.parse(
                    checkedList[i]['amount'].toString(),
                  );
                }
                setState(() {});
              },
              child: Text('Calcuate', style: TextStyle(fontSize: 20)),
            ),
            Text(
              'Total Voilations:: ${_voilationCount}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Challan Amount ::  ${_challanAmount}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
