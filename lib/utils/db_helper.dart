import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? _db;
  final dbName = 'UniMangementSystem ';

  Future<Database> get db async {
    if (_db == null) {
      return await initDB();
    }
    return _db!;
  }

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: 2, onCreate: _onCreateDB);
  }

  FutureOr<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
     create Table `Classes`(
     classId Integer primary key autoincrement,
     className text
     );
     
 
  create Table `Students`(
   studId Integer primary key autoincrement,
   sessionId Integer,
   classId Integer,
   studRoll Integer primary key,
   sessionId Integer, 
   studName text,
   studSession text,
   isActive boolean default true
);

''');

    await db.execute('''
    create Table `Semester`(
      semesterId Integer primary key autoincrement,
      semesterName text
     );
    ''');

    await db.execute('''
      create Table `Session`(
      sessionId Integer primary key autoincrement,
      sessionName text
    );
      ''');
    await db.execute('''
  create Table `Assignments`(
  assignmentId Integer primary key autoincrement,
  assignmentName text,
  assignmentDesc text
);
''');
  }

  rawInsert({required String query}) async {
    Database database = await instance.db;
    int id = await database.rawInsert(query);

    return id;
  }

  rawUpdate({required String query}) async {
    Database database = await instance.db;
    int id = await database.rawUpdate(query);
    return id;
  }

  rawDelete({required String query}) async {
    Database database = await instance.db;
    int id = await database.rawDelete(query);
    return id;
  }

  Future<List<Map<String, Object?>>> getDataByQuery(
      {required String query}) async {
    Database database = await instance.db;
    var res = await database.rawQuery(query);
    print(res);
    return res;
  }
}
