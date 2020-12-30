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
                  borderRadius: BorderRadius.circular(30.0),
                ),
               shadowColor: colorFromHEX('#FDFEFE'),
              elevation: 10.0,
             color: colorFromHEX('#FDFEFE'),
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
                  Icon(
                    Ionicons.md_trophy,
                    color: colorFromHEX('#239B56'),
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
                        Text('Winners',
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
                  Icon(
                    Icons.notifications_active,
                    color: colorFromHEX('#CB4335'),
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
                        Text('Buzzer',
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