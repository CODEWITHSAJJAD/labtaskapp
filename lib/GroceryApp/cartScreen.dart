import 'package:flutter/material.dart';

import 'model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart"), backgroundColor: Colors.green),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemsModel.Cart.isNotEmpty?itemsModel.Cart.toSet().length:0,
              itemBuilder: (context, index) {
                final uniqueItems = itemsModel.Cart.toSet().toList();
                final currentItem = uniqueItems[index];
                itemsModel.itemscount = itemsModel.Cart.where(
                      (element) => element.Name == currentItem.Name,
                ).toList().length;

                return Card(
                  color: Colors.green[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentItem.Name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rs ${currentItem.price.toString()} x ${itemsModel.itemscount} = Rs ${currentItem.price * itemsModel.itemscount}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                itemsModel.Cart.remove(currentItem);
                                setState(() {
                                  itemsModel.totalprice = itemsModel.Cart.isNotEmpty?itemsModel.Cart
                                      .where((e) => e.price != null)
                                      .map((e) => e.price!)
                                      .reduce((value, element) =>
                                  value + element):0;
                                });

                              },
                              icon: Icon(Icons.remove, color: Colors.green),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              itemsModel.itemscount.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                            IconButton(
                              onPressed: () {
                                itemsModel.Cart.add(currentItem);
                                setState(() {
                                  itemsModel.totalprice = itemsModel.Cart
                                      .where((e) => e.price != null)
                                      .map((e) => e.price!)
                                      .reduce((value, element) =>
                                  value + element);
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.green[100]),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                "Total Rs:${itemsModel.totalprice}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
