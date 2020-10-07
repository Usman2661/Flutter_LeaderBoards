class Player{

  static const tblPlayers = 'Players';
  static const colId = 'id';
  static const colPlayerName = 'playerName';
  static const colPlayerAvatar = 'playerAvatar';


  Player({this.id,this.playerName,this.playerAvatar});

  int id;
  String playerName;
  String playerAvatar;


  Player.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    playerName = map[colPlayerName];
    playerAvatar = map[colPlayerAvatar];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colPlayerName: playerName, colPlayerAvatar: playerAvatar};
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}