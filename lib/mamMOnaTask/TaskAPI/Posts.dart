import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostsData extends StatefulWidget {
  PostsData({super.key});

  @override
  State<PostsData> createState() => _PostsDataState();
}

class _PostsDataState extends State<PostsData> {
  List<Map<String,dynamic>> post=[];
  Future<void> _getAllPosts() async {
    var Responce=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    Responce.statusCode==200?post=List<Map<String,dynamic>>.from(json.decode(Responce.body)):print('error');
    print(post);

  }
  @override
  void initState() {
    // TODO: implement initState
    _getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text("Test Api List"),),
      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              _getAllPosts();
              setState(() {
                
              });
            }, style:ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.blue),child: Text("Load List")),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(itemCount: post.length,
                  itemBuilder: (context,i){
                return Card(
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("user id:\t${post[i]["userId"]}",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("id:\t${post[i]["id"]}",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("title:\t${post[i]["title"]}",style: TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("body:\t${post[i]["body"]}",style: TextStyle(color: Colors.green,fontSize: 20,),),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
