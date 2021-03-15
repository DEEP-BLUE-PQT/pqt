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
  final String pcit1;
  final String pcit2;
  final String pcit3;
  final int oldWaitingTime;
  final int displayTime;
  final int wt2;
  final int wt3;
  final String scheduler;
  final String error;
  final String pcotDisplay;

  db(
      {this.depName,
      this.docName,
      this.starttime,
      this.endtime,
      this.dateChoosen,
      this.name,
      this.pcotDisplay,
      this.error,
      this.scheduler,
      this.displayTime,
      this.oldWaitingTime,
      this.pcit1,
      this.pcit2,
      this.pcit3,
      this.wt2,
      this.wt3});

  Future Create() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'pqt.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS dogs (name varchar(11), depName varchar(50), docName varchar(11), starttime varchar(11), endtime varchar(11), dateChoosen varchar(11), pcit1 varchar(11), pcit2 varchar(11),pcit3 varchar(11),oldWaitingTime int , displayTime int , wt2 int , wt3 int , scheduler varchar(11) , error varchar(11), pcotDisplay varchar(11) )');
    });

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO dogs (name, depName, docName, starttime, endtime, dateChoosen, pcit1, pcit2,pcit3,oldWaitingTime, displayTime, wt2, wt3, scheduler , error, pcotDisplay) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
          [
            name,
            depName,
            docName,
            starttime,
            endtime,
            dateChoosen,
            pcit1,
            pcit2,
            pcit3,
            oldWaitingTime,
            displayTime,
            wt2,
            wt3,
            scheduler,
            error,
            pcotDisplay
          ]);
      print('inserted');
    });

    List<Map> list = await database.rawQuery('SELECT * FROM dogs');
    history = list;
    print("***********************");
    print("HISTORY");
    print(history);
  }
}
