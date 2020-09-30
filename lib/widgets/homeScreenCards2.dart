import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';

class HomeScreenCards2 extends StatefulWidget {
  @override
  _HomeScreenCards2State createState() => _HomeScreenCards2State();
}

class _HomeScreenCards2State extends State<HomeScreenCards2> {


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
              // shadowColor: colorFromHEX('#82E0AA'),
              // elevation: 20.0,
             color: colorFromHEX('#196F3D'),
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
                  Text('Winners',
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
                    Ionicons.md_trophy,
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
              // shadowColor: colorFromHEX('#EC7063'),
              // elevation: 20.0,
             color: colorFromHEX('#C0392B'),
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
                  Text('Buzzer',
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
                    Icons.notifications_active,
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