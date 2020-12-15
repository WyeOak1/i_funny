import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/post.dart';

class DatabaseHelper {
  static final _databaseName = "Postdb.db";
  static final _databaseVersion = 1;

  static final table = 'posts_table';

  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnUrl = 'url';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnUrl TEXT NOT NULL
          )
          ''');
  }


  Future<int> insert(Post post) async {
    Database db = await instance.database;
    print('adding '+post.title);
    return await db.insert(table, {'title': post.title, 'url': post.url});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnTitle LIKE '%$name%'");
  }


  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Post post) async {
    Database db = await instance.database;
    int id = post.toMap()['id'];
    return await db
        .update(table, post.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }


  Future<int> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
