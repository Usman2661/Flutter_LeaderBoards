import 'package:leaderboards/db/datatabase_helper.dart';
import 'package:leaderboards/models/game.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';

class GamesService {

    GamesService._();
    static final GamesService instance = GamesService._();

    DatabaseHelper dbHelper = DatabaseHelper.instance;

    // game - create
    Future<int> createGame(Game game) async {
      Database db = await dbHelper.database;
      await checkGameTableUpdated();
      return await db.insert(Game.tblGames, game.toMap());
    }
    //game - update
    Future<int> updateGame(Game game) async {
      Database db = await dbHelper.database;
      return await db.update(Game.tblGames, game.toMap(),
          where: '${Game.colId}=?', whereArgs: [game.id]);
    }
    //game - delete
    Future<int> deleteGame(int id) async {
      Database db = await dbHelper.database;
      return await db.delete(Game.tblGames,
          where: '${Game.colId}=?', whereArgs: [id]);
    }
    //game - retrieve all
    Future<List<Game>> fetchGames() async {
      Database db = await dbHelper.database;
      List<Map> games = await db.rawQuery("SELECT * FROM Games ORDER By id desc");
      return games.length == 0
          ? []
          : games.map((x) => Game.fromMap(x)).toList();
    }



    Future<void> checkGameTableUpdated() async {

      Database db = await dbHelper.database;

        await db.execute('''
          CREATE TABLE IF NOT EXISTS ${Game.tblGames}(
            ${Game.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Game.colGameName} TEXT NOT NULL,
            ${Game.colGameAvatar} TEXT,
            ${Game.colGameOpenStatus} INTEGER DEFAULT 1
            )
        ''');
      }

  
}