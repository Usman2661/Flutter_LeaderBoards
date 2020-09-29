import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreenCards1 extends StatefulWidget {
  @override
  _HomeScreenCards1State createState() => _HomeScreenCards1State();
}

class _HomeScreenCards1State extends State<HomeScreenCards1> {

  Color colorFromHEX(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,10,10),
      child: Row(
        children: <Widget>[
        Expanded(child: 
        Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              shadowColor: colorFromHEX('#85C1E9'),
              elevation: 20.0,
             color: colorFromHEX('#85C1E9'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
              child: 
              Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,10,10),
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
                    AntDesign.USB,
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
                  borderRadius: BorderRadius.circular(40.0),
                ),
              shadowColor: colorFromHEX('#F8C471'),
              elevation: 20.0,
             color: colorFromHEX('#F8C471'),
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
              child: 
              Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,10,10),
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
                    Icons.people_outline,
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