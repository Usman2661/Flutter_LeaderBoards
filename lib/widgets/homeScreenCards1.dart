import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';

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
                  borderRadius: BorderRadius.circular(15.0),
                ),
              // shadowColor: colorFromHEX('#85C1E9'),
              // elevation: 20.0,
             color: colorFromHEX('#2471A3'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
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
                  Text('Games',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                      )
                ],
                ),
                    ),
                  ),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,10,10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:CrossAxisAlignment.end,
                    children: <Widget>[
                 Icon(
                    Ionicons.logo_game_controller_b,
                    color: Colors.white,
                    size: 70.0,
                  ),
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
                  borderRadius: BorderRadius.circular(15.0),
                ),
              // shadowColor: colorFromHEX('#F8C471'),
              // elevation: 20.0,
             color: colorFromHEX('#F39C12'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
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
                  Text('Players',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                      )
                ],
                ),
                    ),
                  ),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,10,10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:CrossAxisAlignment.end,
                    children: <Widget>[
                 Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 70.0,
                  ),
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