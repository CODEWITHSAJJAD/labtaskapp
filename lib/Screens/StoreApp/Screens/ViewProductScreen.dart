import 'package:flutter/material.dart';
import 'package:labtaskapp/Screens/StoreApp/Screens/AddProductScreen.dart';

class StoreViewProductScreen extends StatefulWidget {
  StoreViewProductScreen({super.key});

  @override
  State<StoreViewProductScreen> createState() => _StoreViewProductScreenState();
}

class _StoreViewProductScreenState extends State<StoreViewProductScreen> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, bool>> selectedProducts = [];
  Map<String, bool> returnMapofCate(Map product) {
    return selectedProducts == null
        ? {}
        : {"cato": product["category"], "selected": false};
  }

  List<String> catego = ["hello", "hi"];
  List<bool> cato = [false, false];
  bool selectedcat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
          setState(() {});
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blueAccent,
              child:  Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.store_mall_directory,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "SS INTERPRISES",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),Divider(color: Colors.blueAccent,),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.add_circle, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catego.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        cato[i] = !cato[i];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: ChoiceChip(
                        side: BorderSide(color: Colors.blueAccent),
                        selectedColor: Colors.blueAccent[100],
                        label: Text(
                          catego[i],
                          style: TextStyle(color: Colors.black),
                        ),
                        selected: cato[i],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                // reverse: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueAccent[100],
                    child: ListTile(
                      title: Text("Product Name"),
                      subtitle: Text(
                        "Company:Name, Catergory:Name\nUnit:Name, Price:0\nExpiry:0-00-0000, Sold:0-00-0000",
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(color: Colors.white,
                          borderRadius:BorderRadius.all(Radius.circular(5)),
                        ),
                          width:20,height:20,child: Text("#${index + 1}",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold),)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
