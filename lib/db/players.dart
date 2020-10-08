import 'package:leaderboards/db/datatabase_helper.dart';
import 'package:leaderboards/models/player.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';

class PlayersService {

    PlayersService._();
    static final PlayersService instance = PlayersService._();

    DatabaseHelper dbHelper = DatabaseHelper.instance;

    // Players - create
    Future<int> createPlayer(Player player) async {
      Database db = await dbHelper.database;
      await checkPlayerTableUpdated();
      return await db.insert(Player.tblPlayers, player.toMap());
    }
    //Players - update
    Future<int> updatePlayer(Player player) async {
      Database db = await dbHelper.database;
      return await db.update(Player.tblPlayers, player.toMap(),
          where: '${Player.colId}=?', whereArgs: [player.id]);
    }
    //Players - delete
    Future<int> deletePlayer(int id) async {
      Database db = await dbHelper.database;
      return await db.delete(Player.tblPlayers,
          where: '${Player.colId}=?', whereArgs: [id]);
    }
    //Players - retrieve all
    Future<List<Player>> fetchPlayers() async {
      Database db = await dbHelper.database;
      List<Map> players = await db.rawQuery("SELECT * FROM Players ORDER By id desc");
      return players.length == 0
          ? []
          : players.map((x) => Player.fromMap(x)).toList();
    } 

    Future<void> checkPlayerTableUpdated() async {

      Database db = await dbHelper.database;

       await db.execute('''
      CREATE TABLE IF NOT EXISTS ${Player.tblPlayers}(
        ${Player.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Player.colPlayerName} TEXT NOT NULL,
        ${Player.colPlayerAvatar} TEXT
        )
     ''');
      } 
}