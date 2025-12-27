class itemsModel{
  String Name;
  int price;
  String Catergory;
  String Image;
  itemsModel({required this.Name,required this.price,required this.Catergory,required this.Image});
  static int totalprice=0;
  static int itemscount=0;
  static List<itemsModel> Cart=[];
  static List<itemsModel> Items=[
    itemsModel(Name:"Banana",price:200,Catergory:"Fruits",Image:""),
    itemsModel(Name:"Orange",price:100,Catergory:"Fruits",Image:""),
    itemsModel(Name:"Carrot",price:50,Catergory:"Vegetables",Image:""),
    itemsModel(Name:"Tomatoes",price:200,Catergory:"Vegetables",Image:""),
    itemsModel(Name:"Milk",price:200,Catergory:"Dairy",Image:""),
    itemsModel(Name:"Yogurt",price:220,Catergory:"Dairy",Image:""),
  ];
}