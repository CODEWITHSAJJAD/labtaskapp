import 'package:flutter/material.dart';

import 'GroceryStoreScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          "Select Your Grocery Store",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  spacing: 30,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: homeButtons(
                            "Fresh Basket",
                            "assets/images/freshMart.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "Fresh Basket",
                                  image: "assets/images/freshMart.png",
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: homeButtons(
                            "Green Mart",
                            "assets/images/shopping.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "Green Mart",
                                  image: "assets/images/shopping.png",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: homeButtons(
                            "Daily Needs",
                            "assets/images/minimart.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "Daily Needs",
                                  image: "assets/images/minimart.png",
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: homeButtons(
                            "Budget Foods",
                            "assets/images/foods.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "Budget Foods",
                                  image: "assets/images/foods.png",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: homeButtons(
                            "Metro Grocery",
                            "assets/images/online.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "Metro Grocery",
                                  image: "assets/images/online.png",
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: homeButtons(
                            "City Market",
                            "assets/images/CityMart.png",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroceryStoreScreen(
                                  storeName: "City Market",
                                  image: "assets/images/CityMart.png",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container homeButtons(String name, String imagePath) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
