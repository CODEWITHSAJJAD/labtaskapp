class  SessionTable
{
  static String colId='ID';
  static String colName='Name';
  static String tableName='Session';
  static String createTable='''
create table ${tableName} (${colId} INTEGER PRIMARY KEY AUTOINCREMENT,
                           ${colName} TEXT
                          )
  ''';
}