class Game{

  static const tblGames = 'Games';
  static const colId = 'id';
  static const colGameName = 'gameName';
  static const colGameAvatar = 'gameAvatar';
  static const colLastPlayed = 'lastPlayed';


  Game({this.id,this.gameName,this.gameAvatar, this.lastPlayed});

  int id;
  String gameName;
  String gameAvatar;
  String lastPlayed;


  Game.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    gameName = map[colGameName];
    gameAvatar = map[colGameAvatar];
    lastPlayed = map[colLastPlayed];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colGameName: gameName, colGameAvatar: gameAvatar , colLastPlayed: lastPlayed};
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}