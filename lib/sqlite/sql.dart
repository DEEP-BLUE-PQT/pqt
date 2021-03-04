// import 'dart:async';
//
// import 'package:flutter/widgets.dart';
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:collection/collection.dart';
//
// class DB {
//   final String depName;
//   final String docName;
//   final String starttime;
//   final String endtime;
//   final String dateChoosen;
//   final String name;
//
//   DB({
//     this.depName,
//     this.docName,
//     this.starttime,
//     this.endtime,
//     this.dateChoosen,
//     this.name,
//   });
//
//   db() async {
//     // Avoid errors caused by flutter upgrade.
//     // Importing 'package:flutter/widgets.dart' is required.
//     WidgetsFlutterBinding.ensureInitialized();
//     // Open the database and store the reference.
//     final Future<Database> database = openDatabase(
//       // Set the path to the database. Note: Using the `join` function from the
//       // `path` package is best practice to ensure the path is correctly
//       // constructed for each platform.
//       join(await getDatabasesPath(), 'pqt.db'),
//       // When the database is first created, create a table to store dogs.
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE IF NOT EXISTS dogs (name varchar(11), depName varchar(50), docName varchar(11), starttime time, endtime time, dateChoosen date )",
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: 1,
//     );
//   }
//
//   Future<void> insertDog(Dog dog) async {
//     // Get a reference to the database.
//     final Database dbb = await db();
//     // final Database db = await database;
//
//     // Insert the Dog into the correct table. Also specify the
//     // `conflictAlgorithm`. In this case, if the same dog is inserted
//     // multiple times, it replaces the previous data.
//     await db.insert(
//       'dogs',
//       dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<List<Dog>> dogs() async {
//     // Get a reference to the database.
//     final Database dbb = await db();
//
//     // Query the table for all The Dogs.
//     final List<Map<String, dynamic>> maps = await db.query('dogs');
//
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(
//       maps.length,
//       (i) {
//         return Dog(
//           name: maps[i]['name'],
//           depName: maps[i]['depName'],
//           docName: maps[i]['docName'],
//           starttime: maps[i]['starttime'],
//           endtime: maps[i]['starttime'],
//           dateChoosen: maps[i]['dateChoosen'],
//         );
//       },
//     );
//   }
//
//   // var fido = Dog(
//   //   name: "pratik",
//   //   depName: "ent",
//   //   docName: "Paras Jain",
//   //   starttime: "12:00:12",
//   //   endtime: "14:11:12",
//   //   dateChoosen: "2021-03-08",
//   // );
//
//   // Insert a dog into the database.
//   // await insertDog(fido);
//
//   // Print the list of dogs (only Fido for now).
//   // print(await dogs());
// }
//
// class Dog {
//   final String depName;
//   final String docName;
//   final String starttime;
//   final String endtime;
//   final String dateChoosen;
//   final String name;
//
//   Dog(
//       {this.depName,
//       this.docName,
//       this.starttime,
//       this.endtime,
//       this.dateChoosen,
//       this.name});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'depName': depName,
//       'docName': docName,
//       'starttime': starttime,
//       'endtime': endtime,
//       'dateChoosen': dateChoosen,
//       'name': name
//     };
//   }
//
//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'Dog{id: 1, name: 1, age: 1}';
//   }
// }
