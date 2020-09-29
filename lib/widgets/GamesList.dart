import 'package:flutter/material.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';

class GamesList extends StatefulWidget {
  @override
  _GamesListState createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      child: ListView (
        children: <Widget> [
            Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
                ),
                color: colorFromHEX('#FFFFFF'),
                shadowColor: colorFromHEX('#FFFFFF'),
                elevation: 20.0,
                child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: 
                Expanded(child:   
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10,10,0,10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ 
                     SizedBox(width: 10),
                     CircleAvatar(
                      radius: 40,
                      backgroundColor: colorFromHEX('#E67E22'),
                      child: Text('L',
                        style: TextStyle(
                    color:Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  Text(
                    'Ludo Sibblings',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                      ),
                    ),
                       Text(
                    'Last Played: 10th Sep',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),
                    ),
                    SizedBox(width: 10),
                    Row(children: <Widget>[
                    Icon(Icons.person,
                    size: 30,
                    color:colorFromHEX('#424949'),
                    ),
                    Text('3',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:colorFromHEX('#424949'),
                    )),

                      ],
                      )

                    //   Expanded(flex: 2, child:   CircleAvatar(
                    //   radius: 40,
                    //   backgroundColor: colorFromHEX('#E67E22'),
                    //   child: Text('L',
                    //     style: TextStyle(
                    // color:Colors.white,
                    // fontSize: 50.0,
                    // fontWeight: FontWeight.bold,
                    //   ),
                    //   ),
                    // ),),
                  //   Expanded(flex: 3, child:  Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  // Text(
                  //   'Ludo Sibblings',
                  //   style: TextStyle(
                  //   color:Colors.grey[900],
                  //   fontSize: 25.0,
                  //   fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //      Text(
                  //   'Last Played: 10th Sep',
                  //   style: TextStyle(
                  //   color:Colors.grey[900],
                  //   fontSize: 12.0,
                  //   fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   ],
                  //   )      
                  //   ),
                    
                    // Expanded(
                    //   flex:1,
                    //   child: 
                    //   Row(children: <Widget>[
                    // Icon(Icons.person,
                    // size: 30,
                    // ),
                    // Text('3',
                    // style: TextStyle(
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.bold,
                    // )),

                    //   ],
                    //   )
                    // ),
                ],
                ),
                 )
                )
              ),
              ),
        ]
       
      ),
    );
  }
}