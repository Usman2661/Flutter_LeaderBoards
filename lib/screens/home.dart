import 'package:flutter/material.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';
import 'package:leaderboards/widgets/GamesList.dart';
import 'package:leaderboards/widgets/homeScreenCards1.dart';
import 'package:leaderboards/widgets/homeScreenCards2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFromHEX('#F0F3F4'),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 40,),
          Expanded(flex: 1,child: HomeScreenCards1() ),
          Expanded(flex: 1, child: HomeScreenCards2() ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Open Games',
                style: TextStyle(
                color: colorFromHEX('#424949'),
                fontSize: 35.0,
                fontWeight: FontWeight.bold
                )
            ),
          ),
          Expanded(flex: 2,child: GamesList(),)
        ],
        ),
        )
    );
  }
}