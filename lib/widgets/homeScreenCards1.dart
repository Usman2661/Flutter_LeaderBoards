import 'package:flutter/material.dart';

class HomeScreenCards1 extends StatefulWidget {
  @override
  _HomeScreenCards1State createState() => _HomeScreenCards1State();
}

class _HomeScreenCards1State extends State<HomeScreenCards1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
      Expanded(child: 
      Card(
           color: Colors.white,
            child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
        child: 
      Column(
               mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
              Text('Games',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  )
                  )
        ],
      ),
            ),
      )
      ),
      Expanded(child: 
      Card(
            color: Colors.white,
            child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
              Text('Players',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  )
                  )
        ],
      ),
            ),
      )
      )

    ]);
  }
}