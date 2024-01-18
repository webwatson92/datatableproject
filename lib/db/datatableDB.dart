import 'package:datatableproject/db/db_connection.dart';
import 'package:datatableproject/model/area.dart';
import 'package:sqflite/sqflite.dart';

class datatableDB {
  final tableName =  'datatables';

   Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      "id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "suppliyerId" TEXT NOT NULL,
      "areaname" TEXT NOT NULL,
      "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      "updated_at" INTEGER NOT NULL
      );""");
  }

  //Create
  Future<int> create({required String title}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''INSERT INTO $tableName (areaname, created_at) VALUES (?,?) ''',
        [title, DateTime.now().millisecondsSinceEpoch],
    );
  }

  //Read
  Future<List<Area>> fetchAll() async {
    final database = await DatabaseService().database;
    final datatable = await database.rawQuery(
      '''SELECT * from $tableName ORDER BY COALESCE(updated_at, created_at)''',
    );
    return datatable.map((t) => Area.fromSqfliteDatabase(t)).toList();
  }

  //Find
  Future<Area> fetchById(int id) async {
    final database = await DatabaseService().database;
    final datatable = await database.rawQuery(
      '''SELECT * from $tableName WHERE id = ?''', [id]
    );
    return Area.fromSqfliteDatabase(datatable.first);
  }

  //Update
  Future<int> update({required int id, String? areaname}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,{
        if(areaname != null) 'areaname': areaname,
        'updated_at' : DateTime.now().millisecondsSinceEpoch,
      },
      
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  //Delete
  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete(
      '''DELETE FROM $tableName WHERE id = ?''', [id]
    );
  }

}