import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/screens/games.dart';
import 'package:leaderboards/screens/home.dart';
import 'package:leaderboards/widgets/createGamePlayerDialog.dart';
import 'package:leaderboards/widgets/playersGrid.dart';

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {


    void onBottomNavigationRedirect(int index) {
    switch (index) {
    case 0:
         Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                  ModalRoute.withName('/home'),
                );
      break;
    case 1:
      Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Games()),
                  ModalRoute.withName('/games'),
                );
      break;
    case 2:

      break;
    case 3:
      break;
  }
  }

  void onCreatePlayerCallback(){
      playersGridKey.currentState.loadPlayers();
  }
  void onCreateGameCallback(){

  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: colorFromHEX('#FDFEFE'),
      appBar: AppBar(
            title: Text('Players'),
            backgroundColor: colorFromHEX('#7D3C98'),
            centerTitle: true,
          ),
           floatingActionButton:SizedBox(
            width: 70.0,
            height: 70.0,
            child:  FloatingActionButton(
                    onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                      return CreateGamePlayerDialog(false,onCreateGameCallback, onCreatePlayerCallback);
                                            }); 
                                            },
                                            child: Icon(Icons.add),
                                            backgroundColor:  colorFromHEX('#7D3C98'),
                        ),
                  ),
                              bottomNavigationBar: BottomNavigationBar(
                              backgroundColor: colorFromHEX('#FDFEFE'),
                              type: BottomNavigationBarType.fixed,
                              items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                              icon: Icon(Icons.home,
                              size: 35,
                              color: colorFromHEX('#626567'),
                              ),
                              title: Text('Home',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorFromHEX('#626567'),
                              )),
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Ionicons.logo_game_controller_b ,
                              size: 35, 
                              color: colorFromHEX('#626567'),),
                              title: Text('Games',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                  color: colorFromHEX('#626567'),
                              )),
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.people,
                                size: 35,
                                color: colorFromHEX('#17202A'),
                                ),
                              title: Text('Players' ,
                              style: TextStyle(
                                    fontSize: 16,
                                fontWeight: FontWeight.bold,
                                  color: colorFromHEX('#17202A'),
                              )),
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                Ionicons.md_trophy,
                              size: 35,
                              color: colorFromHEX('#424949'),
                              ),
                              title: Text('Winners',
                              style: TextStyle(
                              fontSize: 16,
                                fontWeight: FontWeight.bold,
                                  color: colorFromHEX('#626567'),

                              )),
                            ),
                              ],
                              currentIndex: 2,
                              onTap: onBottomNavigationRedirect,
                              ),
                                body: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex:1,
                                        child:  Container(
                                      decoration:  BoxDecoration(
                                        color: colorFromHEX('#EAEDED'),
                                        borderRadius: new BorderRadius.only(
                                          bottomLeft:const Radius.circular(0.0),
                                          bottomRight: const Radius.circular(0.0),
                                        )
                                      ),
                                          child: null
                                          ) 
                                          ),
                                          SizedBox(height: 10),
                                          Expanded(
                                              flex: 3,
                                              child:PlayersGrid(key: playersGridKey)
                                      ), 
                                  ],
                                  ),
                              ),
                          );
  }
}