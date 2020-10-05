import 'dart:io';
import 'package:leaderboards/models/game.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'GameDatabase.db';
  static const _databaseVersion = 1;

  //singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    print(dbPath);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    //create tables
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Game.tblGames}(
        ${Game.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Game.colGameName} TEXT NOT NULL,
        ${Game.colGameAvatar} TEXT,
        ${Game.colLastPlayed} TEXT
        )
     ''');
  }

  Future<int> createGame(Game game) async {
      Database db = await database;
      return await db.insert(Game.tblGames, game.toMap());
    }
    //contact - update
    Future<int> updateGame(Game game) async {
      Database db = await database;
      return await db.update(Game.tblGames, game.toMap(),
          where: '${Game.colId}=?', whereArgs: [game.id]);
    }
    //contact - delete
    Future<int> deleteGame(int id) async {
      Database db = await database;
      return await db.delete(Game.tblGames,
          where: '${Game.colId}=?', whereArgs: [id]);
    }
    //contact - retrieve all
    Future<List<Game>> fetchGames() async {
      Database db = await database;
      List<Map> games = await db.rawQuery("SELECT * FROM Games ORDER By id desc");
      return games.length == 0
          ? []
          : games.map((x) => Game.fromMap(x)).toList();
    }

  
}