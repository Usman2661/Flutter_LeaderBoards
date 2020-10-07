import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/models/game.dart';
import 'package:leaderboards/screens/games.dart';
import 'package:leaderboards/widgets/GamesList.dart';
import 'package:leaderboards/widgets/homeScreenCards1.dart';
import 'package:leaderboards/widgets/homeScreenCards2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Game> game;


  void onBottomNavigationRedirect(int index) {
    switch (index) {
    case 0:
      break;
    case 1:
      Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Games()),
                  ModalRoute.withName('/'),
                );
      break;
    case 2:
      break;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHEX('#F2F3F4'),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorFromHEX('#FDFEFE'),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            size: 30,
            ),
            title: Text('Home',
             style: TextStyle(
              fontSize: 14,
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.logo_game_controller_b , size: 30,  color: colorFromHEX('#424949'),),
            title: Text('Games',
            style: TextStyle(
              fontSize: 14,
                color: colorFromHEX('#424949'),
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
              color: colorFromHEX('#424949'),
              ),
            title: Text('Players' ,
             style: TextStyle(
              fontSize: 14,
              color: colorFromHEX('#424949'),
            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.md_trophy,
             size: 30,
            color: colorFromHEX('#424949'),
             ),
            title: Text('Winners',
             style: TextStyle(
              fontSize: 14,
              color: colorFromHEX('#424949'),

            )),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   title: Text('Buzzer'),
          // ),
        ],
        currentIndex: 0,
        // selectedItemColor: Colors.amber[800],
        onTap: onBottomNavigationRedirect,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 40,),
          Expanded(flex: 3,child: HomeScreenCards1() ),
          Expanded(flex: 3, child: HomeScreenCards2() ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Open Games',
                style: TextStyle(
                color: colorFromHEX('#424949'),
                fontSize: 25.0,
                fontWeight: FontWeight.w500
                )
            ),
          ),
          Expanded(flex: 5, child:GamesList(key: gamesListKeyHome),)
        ],
        ),
        )
    );
  }
}