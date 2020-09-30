import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/screens/home.dart';
import 'package:leaderboards/widgets/GamesList.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

    void onBottomNavigationRedirect(int index) {
    switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
      break;
    case 1:
      break;
    case 2:
      
      break;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Games'),
            backgroundColor: colorFromHEX('#2471A3'),
            centerTitle: true,
          ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorFromHEX('#FDFEFE'),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
             BottomNavigationBarItem(
            icon: Icon(Icons.home,
            size: 30,
            color: colorFromHEX('#424949'),
            ),
            title: Text('Home',
             style: TextStyle(
              fontSize: 14,
                              color: colorFromHEX('#424949'),

            )),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.logo_game_controller_b , size: 30),
            title: Text('Games',
            style: TextStyle(
              fontSize: 14,
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
        currentIndex: 1,
        // selectedItemColor: Colors.amber[800],
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
                  color: colorFromHEX('#2471A3'),
                  borderRadius: new BorderRadius.only(
                    bottomLeft:const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  )
                ),
                    child: null
                    ) 
                    ),
                      Expanded(
                        flex: 3,
                  child: GamesList()
                ), 
            ],
            ),
        ),
    );
  }
}