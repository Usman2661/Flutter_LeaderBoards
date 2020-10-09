import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/db/players.dart';
import 'package:leaderboards/models/player.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';


GlobalKey<_PlayersGridState> playersGridKey = GlobalKey(debugLabel: 'playersGridKey');


class PlayersGrid extends StatefulWidget {

  PlayersGrid({Key key}) : super(key: key);

  @override
  _PlayersGridState createState() => _PlayersGridState();
}

enum PlayerOptions { edit, delete }

class _PlayersGridState extends State<PlayersGrid> {

  PlayersService playersService;
  List<Player> players = [];


  loadPlayers() async {  
  List<Player> playersData = await playersService.fetchPlayers();

    setState(() {
      players = playersData;
    });
  }

  @override
  void initState() {
    super.initState();
    playersService = PlayersService.instance;
    loadPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount:  players == null ? 0 : players.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 170,
              child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                shadowColor: colorFromHEX('#FDFEFE'),
                elevation: 20.0,
               color: colorFromHEX('#FDFEFE'),
                child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () { 
                },
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child:  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                    PopupMenuButton<PlayerOptions>(
                    onSelected: (PlayerOptions result) async { 
                      if (result == PlayerOptions.delete){
                                            return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Player"),
                        content:Text('Are you sure you want to delete ${players[index].playerName}?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                               await playersService.deletePlayer(players[index].id);
                               await loadPlayers();
                               Navigator.of(context).pop(true);
                            },
                            child: const Text("DELETE")
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                    );

                      }
                      else {
                        print(' I want to edit this');
                      }
                      
                      },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<PlayerOptions>>[
                    const PopupMenuItem<PlayerOptions>(
                      value: PlayerOptions.edit,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<PlayerOptions>(
                      value: PlayerOptions.delete,
                      child: Text('Delete'),
                    ),
                  ],
                ),
                    ],
                    ),
                    ),

                    Expanded(flex: 4,child:  Container(
                    child: 
                    Column(children: <Widget>[
                      Container(child: 
                         players[index].playerAvatar.toString() != '' ?
                    CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        radius: 40.0,
                        child: CircleAvatar(
                        backgroundImage: FileImage(File(players[index].playerAvatar.toString(),)),
                        backgroundColor: Colors.white,
                        radius: 38.0,
                        ),
                    )  
                    : 
                    CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child:CircleAvatar(
                     radius: 38,
                     backgroundColor: colorFromHEX('#7D3C98'),
                     child: Text(players[index].playerName.toString().toUpperCase().substring(0,1),
                       style: TextStyle(
                       color:Colors.white,
                       fontSize: 30.0,
                     ),
                     ),
                     ),
                    ),
                    ),
                      Text(players[index].playerName.toString(),
                       style: TextStyle(
                       color:Colors.black,
                       fontSize: 24.0,
                       fontWeight: FontWeight.w500,
                     )),
                    ],
                    )
                    ),
                    ),
                     Expanded(
                       flex: 1,
                       child: Container(
                        decoration:  BoxDecoration(
                            color: colorFromHEX('#7D3C98'),
                              borderRadius: new BorderRadius.only(
                              bottomLeft:const Radius.circular(15.0),
                              bottomRight: const Radius.circular(15.0),
                            ),
                            ),
                         child:Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             child: Row(children: <Widget>[
                            Icon(Ionicons.logo_game_controller_b ,
                            size: 30,
                            color:colorFromHEX('#FDFEFE'),
                            ),
                          Text('8',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:colorFromHEX('#FDFEFE'),
                          )),
                           ],
                           ),
                           ),
                           SizedBox(width: 20),
                            Container(
                             child: Row(children: <Widget>[
                            Icon(Ionicons.md_trophy,     
                            size: 30,
                            color:colorFromHEX('#FDFEFE'),
                            ),
                          Text('2',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:colorFromHEX('#FDFEFE'),
                          )),
               
                           ],
                           ),
                           )
                     ],
                     ),
                     )
                     )

                  ],
                ),
                ),
                ),

       
            );
          }
          ),
    );
  }
}