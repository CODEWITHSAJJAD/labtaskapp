import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'cartScreen.dart';
import 'model.dart';

class GroceryStoreScreen extends StatefulWidget {
  String storeName,image;
  GroceryStoreScreen({super.key,required this.storeName,required this.image});

  @override
  State<GroceryStoreScreen> createState() => _GroceryStoreScreenState();
}

class _GroceryStoreScreenState extends State<GroceryStoreScreen> {
  List<String> Cate = ["ALL", "FRUITS", "VEGETABLES", "DAIRY"];

  List<itemsModel> item = itemsModel.Items;
  String SelectedCategory = "ALL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.storeName),
        actions: [GestureDetector(
          onTap: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          setState(() {

          });
            },
          child:Badge.count(
              count: itemsModel.Cart.length,
              child:Icon(Icons.shopping_cart, color: Colors.white)
          )
        )],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Image.asset(
              widget.image,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text("All"),
              items: Cate.map((String Cat) {
                return DropdownMenuItem(value: Cat, child: Text(Cat));
              }).toList(),
              value: SelectedCategory,
              onChanged: (String? newValue) {
                SelectedCategory = newValue!;
                SelectedCategory == "ALL"
                    ? item = itemsModel.Items
                    : item = itemsModel.Items.where(
                        (element) => element.Catergory.toLowerCase().contains(
                          SelectedCategory.toLowerCase(),
                        ),
                      ).toList();
                setState(() {});
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: 400,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                elevation: 4,
                offset: Offset(0, -5),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: (item.length / 2).ceil(),
              itemBuilder: (context, index) {
                int first = index * 2;
                int second = first + 1;

                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/shopping.png",
                                height: 60,
                                width: 60,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item[first].Name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${item[first].Catergory}",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              Text(
                                "RS ${item[first].price}",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                    itemsModel.Cart.add(item[first]);
                                    setState(() {
                                      itemsModel.totalprice = itemsModel.Cart
                                          .where((e) => e.price != null)
                                          .map((e) => e.price!)
                                          .reduce((value, element) =>
                                          value + element);
                                    });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add_shopping_cart),
                                    SizedBox(width: 5),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    second < item.length
                        ? Expanded(
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/shopping.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item[second].Name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "${item[second].Catergory}",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "RS ${item[second].price}",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        itemsModel.Cart.add(item[second]);
                                        setState(() {
                                          itemsModel.totalprice = itemsModel.Cart
                                              .where((e) => e.price != null)
                                              .map((e) => e.price!)
                                              .reduce((value, element) =>
                                          value + element);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.add_shopping_cart),
                                          SizedBox(width: 5),
                                          Text(
                                            "Add",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
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
            child:Center(child: Text("Total Rs:${itemsModel.totalprice}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),)),
          )
        ],
      ),
    );
  }
}
