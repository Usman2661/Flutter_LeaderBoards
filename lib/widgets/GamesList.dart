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
                borderRadius: BorderRadius.circular(20.0),
                ),
                color: colorFromHEX('#F4F6F6'),
                // shadowColor: colorFromHEX('#FFFFFF'),
                elevation: 2.0,
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
                    Expanded(flex: 1 , child:    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/ludo.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: 
                    Column(
                    children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                       Flexible(child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                    'Ludo League',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                      ),
                    ),
                       Text(
                    'Last Played: 17th June',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,0),
                      child: Container(
                        child: Row(children: <Widget>[
                                 Text('4',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:colorFromHEX('#424949'),
                      )),
                              Icon(Icons.person,
                      size: 30,
                      color:colorFromHEX('#424949'),
                      ),
               
                        ],
                        ) 
                        ,
                        ),
                    )
                
      
                        ],
                        )
                      ],
                      ),
                      )
                ],
                ),
                 )
                )
              ),
              ),



                         Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
                color: colorFromHEX('#F4F6F6'),
                // shadowColor: colorFromHEX('#FFFFFF'),
                // elevation: 20.0,
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
                    Expanded(flex: 1 , child:    CircleAvatar(
                      radius: 40,
                      backgroundColor: colorFromHEX('#D68910'),
                      child: Text('A',
                        style: TextStyle(
                        color:Colors.white,
                        fontSize: 30.0,
                    // fontWeight: FontWeight.bold,
                      ),
                      ),
                      ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: 
                    Column(
                    children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                       Flexible(child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                    'Anktaakshari',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                      ),
                    ),
                       Text(
                    'Last Played: 17th June',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,0),
                      child: Container(
                        child: Row(children: <Widget>[
                                 Text('7',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:colorFromHEX('#424949'),
                      )),
                              Icon(Icons.person,
                      size: 30,
                      color:colorFromHEX('#424949'),
                      ),
              
                        ],
                        ) 
                        ,
                        ),
                    )
                
      
                        ],
                        )
                      ],
                      ),
                      )
                ],
                ),
                 )
                )
              ),
              ),




                           Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
                color: colorFromHEX('#F4F6F6'),
                // shadowColor: colorFromHEX('#FFFFFF'),
                elevation: 2.0,
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
                    Expanded(flex: 1 , child:    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/soccer.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: 
                    Column(
                    children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                       Flexible(child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                    'Soccer',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                      ),
                    ),
                       Text(
                    'Last Played: 17th June',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,0),
                      child: Container(
                        child: Row(children: <Widget>[
                                 Text('11',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:colorFromHEX('#424949'),
                      )),
                              Icon(Icons.person,
                      size: 30,
                      color:colorFromHEX('#424949'),
                      ),
               
                        ],
                        ) 
                        ,
                        ),
                    )
                
      
                        ],
                        )
                      ],
                      ),
                      )
                ],
                ),
                 )
                )
              ),
              ),





                           Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
                color: colorFromHEX('#F4F6F6'),
                // shadowColor: colorFromHEX('#FFFFFF'),
                elevation: 2.0,
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
                    Expanded(flex: 1 , child:    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/cards.jpg'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: 
                    Column(
                    children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                       Flexible(child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                    'Bluff',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                      ),
                    ),
                       Text(
                    'Last Played: 17th June',
                    style: TextStyle(
                    color:colorFromHEX('#424949'),
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,0),
                      child: Container(
                        child: Row(children: <Widget>[
                                 Text('4',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:colorFromHEX('#424949'),
                      )),
                              Icon(Icons.person,
                      size: 30,
                      color:colorFromHEX('#424949'),
                      ),
               
                        ],
                        ) 
                        ,
                        ),
                    )
                
      
                        ],
                        )
                      ],
                      ),
                      )
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