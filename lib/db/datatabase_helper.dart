import 'dart:io';
import 'package:leaderboards/models/game.dart';
import 'package:leaderboards/models/player.dart';
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

    print('onCreate is running');
   // create tables
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Game.tblGames}(
        ${Game.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Game.colGameName} TEXT NOT NULL,
        ${Game.colGameAvatar} TEXT,
        ${Game.colGameOpenStatus} INTEGER DEFAULT 1
        )
     ''');

     await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Player.tblPlayers}(
        ${Player.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Player.colPlayerName} TEXT NOT NULL,
        ${Player.colPlayerAvatar} TEXT
        )
     ''');
  }  
}