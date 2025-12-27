import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Leave{
  Database ?_database;
  Leave._unmaed();
  static Leave instance=Leave._unmaed();
  String tableQuery="Create Table Leave(date TEXT,student_name TEXT,comments TEXT,teacher_name TEXT,title TEXT,type TEXT,isApproved bool)";
  String getLeaveQuery="Select * from Leave";
  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await initializeDB();
    return _database!;
  }
  Future<Database> initializeDB()async{
    String dbpath=await getDatabasesPath();
    String path=join(dbpath,"Leaves.db");
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  _createDB(Database db,int version)async{
    String createQuery=tableQuery;
    await db.execute(createQuery);
  }
  Future<int> insertleave(String date,String student_name,String comments,String teacher_name,String title,String type,bool isApproved)async{
    Database db=await database;
    Map<String,dynamic> data= {
      "date":date,
      "title":title,
      "student_name":student_name,
      "comments":comments,
      "teacher_name":teacher_name,
      "type":type,
      "isApproved":isApproved
    };
    return await db.insert("Leave", data);
  }
  Future<List<Map<String,dynamic>>> getLeaves()async {
    Database db = await database;
    String getQuery = "Select * from Leave";
    return await db.rawQuery(getQuery);
  }

}