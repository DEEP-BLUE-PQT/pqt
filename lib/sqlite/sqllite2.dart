import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import '../constants.dart';

class db {
  final String depName;
  final String docName;
  final String starttime;
  final String endtime;
  final String dateChoosen;
  final String name;
  db({
    this.depName,
    this.docName,
    this.starttime,
    this.endtime,
    this.dateChoosen,
    this.name,
  });

  Future Create() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'pqt.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS dogs (name varchar(11), depName varchar(50), docName varchar(11), starttime varchar(11), endtime varchar(11), dateChoosen varchar(11) )');
    });

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO dogs (name, depName, docName,starttime,endtime,dateChoosen ) VALUES(?,?,?,?,?,?)',
          [name, depName, docName, starttime, endtime, dateChoosen]);
      print('inserted');
    });

    List<Map> list = await database.rawQuery('SELECT * FROM dogs');
    history = list;
  }
}
