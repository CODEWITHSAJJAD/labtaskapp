// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DBHelper
// {
//   static DBHelper INSTANCE=DBHelper._unamed();
//   Database ? _database;
//   DBHelper._unamed(); // private unnamed constructor
//   Future<Database> get database async{
//     if(_database!=null) return _database!;
//
//     _database= await initializeDB();
//     return _database!;
//   }
//   Future<Database> initializeDB()async{
//     String dbpath=await getDatabasesPath();
//     String path=join(dbpath,'phonebook.db');
//     return await openDatabase(path,version: 1,
//         onCreate: _createDB
//     );
//   }
//   _createDB(Database db,int version) async{
//     String query='''
// Create table Contact (ID INTEGER PRIMARY KEY AUTOINCREMENT,
// Name TEXT,Phone TEXT,Image TEXT,Email TEXT
// )
// ''';
//     await db.execute(query);
//
//   }
//   Future<int> insertRaw(String name,String number,String ?image,String ?email)
//   async {
//     //   String query='''
//     //    insert into Contact (name,number,imageString,email) values
//     //     ('${name}','${number}','${image}','${email}')
//     //    ''';
//     //    Database db=await database;
//     //  return await db.rawInsert(query);
//     Database db = await database;
//     Map<String, dynamic> data = {
//       'Name': name,
//       'Phone': number,
//       'Image': image,
//       'Email': email,
//     };
//     return await db.insert('Contact', data);
//
//   }
//   Future<List<Map<String,dynamic>>> getContactsRaw()async
//   {
//     Database db=await database;
//     String query='Select * from  Contact';
//     return await db.rawQuery(query);
//   }
// }

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DBHelper {
  Database ? _database;
  DBHelper._unamed();
  static DBHelper INSTANCE=DBHelper._unamed();
  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await initializeDB();
    return _database!;
  }
  Future<Database> initializeDB()async{
    String dbpath=await getDatabasesPath();
    String path=join(dbpath,"myconatct_book.db");
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  _createDB(Database db,int version)async{
  String createQuery="Create table Contacts(ID INTEGER PRIMARY KEY AUTOINCREMENT,Name TEXT,Phone TEXT,Email TEXT,Image TEXT)";
  await db.execute(createQuery);
  }
  Future<int> insertRaw(String name,String phone,String? email,String? image)async{
    Database db=await database;
    // String insertQuery="Insert into Contacts(Name,Phone,Email,Image) values(${name},${phone},${email},${image})";
    // return await db.rawInsert(insertQuery);
    Map<String,dynamic> data= {
      "Name":name,
      "Phone":phone,
      "Email":email,
      "Image":image
    };
    return await db.insert("Contacts", data);
  }
  Future<List<Map<String,dynamic>>> getContactsRaw()async {
    Database db = await database;
    String getQuery = "Select * from Contacts";
    return await db.rawQuery(getQuery);
  }
  Future<int> updateRaw(int id,String name,String phone,String? email,String? image)async {
    Database db=await database;
    String upateQuery="Update Contacts set Name=${name},Phone=${phone},Email=${email},Image=${image} where ID=${id}";
    return await db.rawUpdate(upateQuery);
  }
  Future<int> deleteRaw(int id)async {
    Database db=await database;
    String deleteQuery="Delete from Contacts where ID=${id}";
    return await db.rawDelete(deleteQuery);
  }
}