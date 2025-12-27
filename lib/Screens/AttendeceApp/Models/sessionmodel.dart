import '../DB/Tables/SessionTable.dart';

class SesssionModel
{
  int id;
  String name;
  SesssionModel({required this.id,required this.name});
  factory SesssionModel.fromMap(Map<String,dynamic> row)
  {
    return SesssionModel(id: row[SessionTable.colId], name:row[SessionTable.colName]);
  }
  Map<String,dynamic> toMap()
  {
    return{
      SessionTable.colName:name
    };
  }

}