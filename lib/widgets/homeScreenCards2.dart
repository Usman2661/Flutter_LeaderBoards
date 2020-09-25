import 'package:flutter/material.dart';

class HomeScreenCards2 extends StatefulWidget {
  @override
  _HomeScreenCards2State createState() => _HomeScreenCards2State();
}

class _HomeScreenCards2State extends State<HomeScreenCards2> {
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
              Text('Winners',
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
              Text('Buzzer',
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