import 'package:sqflite/sqflite.dart';

import '../Models/sessionmodel.dart';
import 'Tables/SessionTable.dart';

class DBHelper
{
  static DBHelper instance=DBHelper._init();
  DBHelper._init();
  Database? _db;
  Future<Database> _getDB()async
  {
      if(_db==null){
        _db=await _initDB();
      }
      return _db!;
  }
  Future<Database> _initDB()async
  {
    String dbPath=await getDatabasesPath();
    String dbFilePath='${dbPath}/attend.db';
    Database db  =await openDatabase(dbFilePath,version: 1,onCreate: _createDB);
    return db;
  }
  _createDB (Database db,int version) async
  {
   await db.execute(SessionTable.createTable);

  }
  Future<int> addNewSession( SesssionModel sessionmodel)async
  {
    Database db=await _getDB();
   return  await db.insert(SessionTable.tableName, sessionmodel.toMap());
  }
  Future<SesssionModel?> getCurrentSession()async
  {
     Database db=await _getDB();
   List<Map<String,dynamic>> rows =await db.query(SessionTable.tableName,orderBy: '${SessionTable.colId} DESC',limit: 1);
    if(rows.isEmpty)
    return null;
    return SesssionModel.fromMap(rows[0]);
  }

}