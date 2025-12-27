import 'package:flutter/material.dart';
import 'parking.dart';

class MyParkingApp extends StatefulWidget {
  MyParkingApp({super.key});

  @override
  State<MyParkingApp> createState() => _MyParkingAppState();
}

class _MyParkingAppState extends State<MyParkingApp> {
  List<int> earnings = [];
  int totalEarnings = 0;
  int type = 0;
  int count = 0;
  List<ParkingModel> searchList = [];


  TextEditingController regController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parking System"),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            EarningButton(),
            CardView(),
            SearchVehical(),
            ShowVehicles(),
          ],
        ),
      ),
    );
  }

  Widget ShowVehicles() {
    count = searchList.length;

    return Expanded(
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, val) {
          return Card(
            color: Colors.lightGreen,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  searchList[val].icn,
                  SizedBox(width: 20),
                  Text(searchList[val].name),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightGreen,
                    ),
                      onPressed: () {
                        setState(() {
                          ParkingModel.parkingModel.removeWhere(
                                (vehicle) => vehicle.name == searchList[val].name,
                          );
                          if (searchController.text.isNotEmpty) {
                            searchList = ParkingModel.parkingModel
                                .where((element) => element.name
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                                .toList();
                          } else {
                            searchList = ParkingModel.parkingModel;
                          }
                        });
                      },

                      child: Text("Park Out"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget SearchVehical() {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Search Vehicle",
        hintStyle: TextStyle(color: Colors.lightGreen[100]),
        prefixIcon: Icon(Icons.search, color: Colors.lightGreen),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        ),
      ),
      onChanged: (value) {
        searchList=ParkingModel.parkingModel.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
        setState(() {
        });
      },
    );
  }

  Widget CardView() {
    return Card(
      color: Colors.lightGreen,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              controller: regController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter Registration Number",
                hintStyle: TextStyle(color: Colors.green[100]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Colors.white,
                  value: 1,
                  groupValue: type,
                  onChanged: (int? val) {
                    setState(() {
                      type = val!;
                    });
                  },
                ),
                Text(
                  "Car",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(width: 20),
                Radio(
                  activeColor: Colors.white,
                  value: 2,
                  groupValue: type,
                  onChanged: (int? val) {
                    setState(() {
                      type = val!;
                    });
                  },
                ),
                Text(
                  "Bike",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.lightGreen,
              ),
              onPressed: () {
                setState(() {
                  if (type != 0) {
                    bool alreadyParked = ParkingModel.parkingModel.any(
                      (vehicle) =>
                          vehicle.name.toLowerCase() ==
                          regController.text.toLowerCase(),
                    );

                    if (!alreadyParked) {
                      if (type == 1) {
                        ParkingModel.parkingModel.add(
                          ParkingModel(
                            name: regController.text,
                            icn: Icon(
                              Icons.car_rental,
                              color: Colors.greenAccent,
                            ),
                          ),
                        );
                        earnings.add(100);
                        searchList=ParkingModel.parkingModel;
                      } else if (type == 2) {
                        ParkingModel.parkingModel.add(
                          ParkingModel(
                            name: regController.text,
                            icn: Icon(
                              Icons.motorcycle,
                              color: Colors.greenAccent,
                            ),
                          ),
                        );
                        searchList=ParkingModel.parkingModel;
                        earnings.add(50);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Already Parked"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                });
              },
              child: Text("Park In"),
            ),
          ],
        ),
      ),
    );
  }

  Widget EarningButton() {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            totalEarnings = earnings.isEmpty?0:earnings.reduce((a, b) => a + b);
          });
        },
        child: Text("My Earnings:Rs $totalEarnings"),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.lightGreen,
          side: BorderSide(color: Colors.lightGreen),
        ),
      ),
    );
  }
}
