import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:labtaskapp/Screens/ContactBook/DB/DB.dart';
import 'newContact.dart';

class showContacts extends StatefulWidget {
  const showContacts({super.key});

  @override
  State<showContacts> createState() => _showContactsState();
}

class _showContactsState extends State<showContacts> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> contactsList = [];
  bool isfetching = true;
  Future<void> _getAllContact() async {
    contactsList = await DBHelper.INSTANCE.getContactsRaw();
    isfetching = false;
    setState(() {});
  }

  @override
  void initState() {
    _getAllContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewContactScreen();
              },
            ),
          );
          _getAllContact();
          setState(() {});
        },backgroundColor:Colors.green[900],
        foregroundColor: Colors.yellow,
        child: Text("+"),
      ),
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),

                hint: Text("Search"),
                prefix: Icon(Icons.search,color: Colors.green,)
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            isfetching
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                  child: ListView.builder(
                    itemCount: contactsList.length,
                    itemBuilder: (context, index) {
                      return contactsList.isEmpty
                          ? Text("No Contacts Found")
                          : Card(
                        color: Colors.green[900],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.amber,
                                      backgroundImage:
                                          contactsList[index]["Image"] == null
                                              ? null
                                              : MemoryImage(
                                                base64Decode(
                                                  contactsList[index]["Image"],
                                                ),
                                              ),
                                    ),
                                    SizedBox(width: 25,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 10,
                                      children: [
                                        Text(contactsList[index]["Name"],style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
                                        Text(contactsList[index]["Phone"],style: TextStyle(color: Colors.amber[200]),),
                                        contactsList[index]["Email"] != null
                                            ? Text(contactsList[index]["Email"],style: TextStyle(color: Colors.brown[100]),)
                                            : Text(''),
                                      ],
                                    ),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        DBHelper.INSTANCE.deleteRaw(contactsList[index]["ID"]);
                                        _getAllContact();
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.delete,color: Colors.red,),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                      },
                                      icon: Icon(Icons.edit,color: Colors.white,),
                                    ),
                                  ],
                                ),
                              ],
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
