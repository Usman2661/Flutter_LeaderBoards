import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leaderboards/db/datatabase_helper.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/models/game.dart';

class GamesList extends StatefulWidget {
  @override
  _GamesListState createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {

  DatabaseHelper _dbHelper;

  List<Game> games = [];

  loadGames() async {
  List<Game> gamesData = await _dbHelper.fetchGames();
    setState(() {
      games = gamesData;
    });
  }

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    loadGames();
  }
  @override
  Widget build(BuildContext context) {
    // loadGames();
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:  games == null ? 0 : games.length,
        itemBuilder: (BuildContext context, int index) {
           return Dismissible(
                    key: ObjectKey(games[index]),
                    background: Container(
                      color: Colors.red, 
                      child:  Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 36.0,
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Game"),
                        content:Text('Are you sure you want to delete ${games[index].gameName}?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                               await _dbHelper.deleteGame(games[index].id);
                               await loadGames();
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
                },
                  
                    child:
             Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: 
                    Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
                color: colorFromHEX('#FDFEFE'),
                // shadowColor: colorFromHEX('#FFFFFF'),
                elevation: 2.0,
                child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: 
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,0,10),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[ 
                   Expanded(flex: 1 , 
                     child: games[index].gameAvatar.toString() != '' ?
                    CircleAvatar(
                        backgroundColor: Colors.grey[700],
                        radius: 40.0,
                        child: CircleAvatar(
                        backgroundImage: FileImage(File(games[index].gameAvatar.toString(),)),
                        backgroundColor: Colors.white,
                        radius: 38.0,
                        ),
                    )  
                    : 
                    CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child:    CircleAvatar(
                     radius: 38,
                     backgroundColor: colorFromHEX('#D68910'),
                     child: Text(games[index].gameName.toString().toUpperCase().substring(0,1),
                       style: TextStyle(
                       color:Colors.white,
                       fontSize: 30.0,
                     ),
                     ),
                     ),
                    ) 
   
                 ),
                 SizedBox(width: 10),
                 Expanded(
                   flex: 3,
                   child: 
                   Column(
                   children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                      Flexible(child:    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                     Text(
                   games[index].gameName.toString(),
                   style: TextStyle(
                   color:colorFromHEX('#424949'),
                   fontSize: 25.0,
                   fontWeight: FontWeight.w400,
                     ),
                   ),
                      Text(
                   'Last Played: 17th June',
                   style: TextStyle(
                   color:colorFromHEX('#424949'),
                   fontSize: 12.0,
                   // fontWeight: FontWeight.bold,
                     ),
                   ),
                   ],
                   ),
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0,0,20,0),
                     child: Container(
                       child: Row(children: <Widget>[
                                Text('4',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w500,
                       color:colorFromHEX('#424949'),
                     )),
                             Icon(Icons.person,
                     size: 30,
                     color:colorFromHEX('#424949'),
                     ),
               
                       ],
                       ) 
                       ,
                       ),
                   )
                
      
                       ],
                       )
                     ],
                     ),
                     )
                ],
                ),
                )
              ),
              ),



              //            Card(
              //   shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20.0),
              //   ),
              //   color: colorFromHEX('#FDFEFE'),
              //   // shadowColor: colorFromHEX('#FFFFFF'),
              //   // elevation: 20.0,
              //   child: InkWell(
              //   splashColor: Colors.blue.withAlpha(30),
              //   onTap: () {},
              //   child: 
              //   Padding(
              //     padding: const EdgeInsets.fromLTRB(10,10,0,10),
              //     child: Row(
              //      mainAxisAlignment: MainAxisAlignment.start,
              //      children: <Widget>[ 
              //      Expanded(flex: 1 , child:    CircleAvatar(
              //        radius: 40,
              //        backgroundColor: colorFromHEX('#D68910'),
              //        child: Text('A',
              //          style: TextStyle(
              //          color:Colors.white,
              //          fontSize: 30.0,
              //      // fontWeight: FontWeight.bold,
              //        ),
              //        ),
              //        ),
              //    ),
              //    SizedBox(width: 10),
              //    Expanded(
              //      flex: 3,
              //      child: 
              //      Column(
              //      children: <Widget>[
              //          Row(
              //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //            children: <Widget>[
              //         Flexible(child:    Column(
              //        crossAxisAlignment: CrossAxisAlignment.start,
              //        children: <Widget>[
              //        Text(
              //      'Anktaakshari',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 25.0,
              //      fontWeight: FontWeight.w400,
              //        ),
              //      ),
              //         Text(
              //      'Last Played: 17th June',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 12.0,
              //      // fontWeight: FontWeight.bold,
              //        ),
              //      ),
              //      ],
              //      ),
              //      ),
              //      Padding(
              //        padding: const EdgeInsets.fromLTRB(0,0,20,0),
              //        child: Container(
              //          child: Row(children: <Widget>[
              //                   Text('7',
              //        style: TextStyle(
              //          fontSize: 20,
              //          fontWeight: FontWeight.w500,
              //          color:colorFromHEX('#424949'),
              //        )),
              //                Icon(Icons.person,
              //        size: 30,
              //        color:colorFromHEX('#424949'),
              //        ),
              
              //          ],
              //          ) 
              //          ,
              //          ),
              //      )
                
      
              //          ],
              //          )
              //        ],
              //        ),
              //        )
              //   ],
              //   ),
              //   )
              // ),
              // ),

              //              Card(
              //   shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20.0),
              //   ),
              //   color: colorFromHEX('#FDFEFE'),
              //   // shadowColor: colorFromHEX('#FFFFFF'),
              //   elevation: 2.0,
              //   child: InkWell(
              //   splashColor: Colors.blue.withAlpha(30),
              //   onTap: () {},
              //   child: 
              //   Padding(
              //     padding: const EdgeInsets.fromLTRB(10,10,0,10),
              //     child: Row(
              //      mainAxisAlignment: MainAxisAlignment.start,
              //      children: <Widget>[ 
              //      Expanded(flex: 1 , child:    CircleAvatar(
              //        radius: 40,
              //        backgroundImage: AssetImage('assets/soccer.png'),
              //      ),
              //    ),
              //    SizedBox(width: 10),
              //    Expanded(
              //      flex: 3,
              //      child: 
              //      Column(
              //      children: <Widget>[
              //          Row(
              //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //            children: <Widget>[
              //         Flexible(child:    Column(
              //        crossAxisAlignment: CrossAxisAlignment.start,
              //        children: <Widget>[
              //        Text(
              //      'Soccer',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 25.0,
              //      fontWeight: FontWeight.w400,
              //        ),
              //      ),
              //         Text(
              //      'Last Played: 17th June',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 12.0,
              //      // fontWeight: FontWeight.bold,
              //        ),
              //      ),
              //      ],
              //      ),
              //      ),
              //      Padding(
              //        padding: const EdgeInsets.fromLTRB(0,0,20,0),
              //        child: Container(
              //          child: Row(children: <Widget>[
              //                   Text('11',
              //        style: TextStyle(
              //          fontSize: 20,
              //          fontWeight: FontWeight.w500,
              //          color:colorFromHEX('#424949'),
              //        )),
              //                Icon(Icons.person,
              //        size: 30,
              //        color:colorFromHEX('#424949'),
              //        ),
               
              //          ],
              //          ) 
              //          ,
              //          ),
              //      )
                
      
              //          ],
              //          )
              //        ],
              //        ),
              //        )
              //   ],
              //   ),
              //   )
              // ),
              // ),





              //              Card(
              //   shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20.0),
              //   ),
              //   color: colorFromHEX('#FDFEFE'),
              //   // shadowColor: colorFromHEX('#FFFFFF'),
              //   elevation: 2.0,
              //   child: InkWell(
              //   splashColor: Colors.blue.withAlpha(30),
              //   onTap: () {},
              //   child: 
              //   Padding(
              //     padding: const EdgeInsets.fromLTRB(10,10,0,10),
              //     child: Row(
              //      mainAxisAlignment: MainAxisAlignment.start,
              //      children: <Widget>[ 
              //      Expanded(flex: 1 , child:    CircleAvatar(
              //        radius: 40,
              //        backgroundImage: AssetImage('assets/cards.jpg'),
              //      ),
              //    ),
              //    SizedBox(width: 10),
              //    Expanded(
              //      flex: 3,
              //      child: 
              //      Column(
              //      children: <Widget>[
              //          Row(
              //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //            children: <Widget>[
              //         Flexible(child:    Column(
              //        crossAxisAlignment: CrossAxisAlignment.start,
              //        children: <Widget>[
              //        Text(
              //      'Bluff',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 25.0,
              //      fontWeight: FontWeight.w400,
              //        ),
              //      ),
              //         Text(
              //      'Last Played: 17th June',
              //      style: TextStyle(
              //      color:colorFromHEX('#424949'),
              //      fontSize: 12.0,
              //      // fontWeight: FontWeight.bold,
              //        ),
              //      ),
              //      ],
              //      ),
              //      ),
              //      Padding(
              //        padding: const EdgeInsets.fromLTRB(0,0,20,0),
              //        child: Container(
              //          child: Row(children: <Widget>[
              //                   Text('4',
              //        style: TextStyle(
              //          fontSize: 20,
              //          fontWeight: FontWeight.w500,
              //          color:colorFromHEX('#424949'),
              //        )),
              //                Icon(Icons.person,
              //        size: 30,
              //        color:colorFromHEX('#424949'),
              //        ),
               
              //          ],
              //          ) 
              //          ,
              //          ),
              //      )
                
      
              //          ],
              //          )
              //        ],
              //        ),
              //        )
              //   ],
              //   ),
              //   )
              // ),
              // ),
             )  
            );
        }
          );

  }
}