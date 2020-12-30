import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/screens/games.dart';
import 'package:leaderboards/screens/players.dart';

class HomeScreenCards1 extends StatefulWidget {
  @override
  _HomeScreenCards1State createState() => _HomeScreenCards1State();
}

class _HomeScreenCards1State extends State<HomeScreenCards1> {

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: Row(
        children: <Widget>[
        Expanded(child: 
        Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              shadowColor: colorFromHEX('#FDFEFE'),
              elevation: 10.0,
             color: colorFromHEX('#FDFEFE'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Games()),
                  ModalRoute.withName('/games'),
                );
              },
              child: 
              Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,10,10),
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                     Icon(
                    Ionicons.logo_game_controller_b,
                    color: colorFromHEX('#2874A6'),
                    size: 60.0,
                  ),
                ],
                ),
                    ),
                  ),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,10,10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                    Text('Games',
                      style: TextStyle(
                        color: colorFromHEX('#7B7D7D'),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                  ),
                ),
                ),    
                ],
              ),
              ),
              )
               ),
     Expanded(child: 
        Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              shadowColor: colorFromHEX('#FDFEFE'),
              elevation: 10.0,
             color: colorFromHEX('#FDFEFE'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Players()),
                  ModalRoute.withName('/players'),
                );
              },
              child: 
              Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,10,10),
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                  Icon(
                    Icons.people,
                    color: colorFromHEX('#7D3C98'),
                    size: 60.0,
                  ),
                ],
                ),
                    ),
                  ),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,10,10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                        Text('Players',
                      style: TextStyle(
                        color: colorFromHEX('#7B7D7D'),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                  ),
                ),
                ),    
                ],
              ),
              ),
              )
               ),

      ]),
    );
  }
}