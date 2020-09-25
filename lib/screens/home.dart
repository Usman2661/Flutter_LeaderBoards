import 'package:flutter/material.dart';
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 40,),
          Expanded(flex: 1,child: HomeScreenCards1() ),
          Expanded(flex: 1, child: HomeScreenCards2() ),
          Expanded(flex: 2,child: Container(child: null,))
        ],
        ),
        )
    );
  }
}