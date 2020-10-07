class Game{

  static const tblGames = 'Games';
  static const colId = 'id';
  static const colGameName = 'gameName';
  static const colGameAvatar = 'gameAvatar';
  static const colGameOpenStatus = 'gameOpenStatus';


  Game({this.id,this.gameName,this.gameAvatar, this.gameOpenStatus});

  int id;
  String gameName;
  String gameAvatar;
  bool gameOpenStatus;


  Game.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    gameName = map[colGameName];
    gameAvatar = map[colGameAvatar];
    gameOpenStatus = map[colGameOpenStatus];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colGameName: gameName, colGameAvatar: gameAvatar , colGameOpenStatus:gameOpenStatus};
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}