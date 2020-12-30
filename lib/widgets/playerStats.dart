
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:leaderboards/helper/colorFromHEX.dart';


class PlayerStats extends StatefulWidget {
  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,0,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
                 RawMaterialButton(
                onPressed: () {
                },
                elevation: 2.0,
                fillColor: colorFromHEX('#D2B4DE'),
                child: Icon(
                  Icons.people,
                  size: 35.0,
                  color: colorFromHEX('#6C3483'),
                ),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                ),
              ),
          SizedBox(height: 5),
          Text('3',
          style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 5),
           Text('Total Players',
          style: TextStyle(
            color: colorFromHEX('#626567'),
            fontSize: 16,
            fontWeight: FontWeight.w600
            ),
            ),
          ],
          ),
            Column(children: <Widget>[
          RawMaterialButton(
                onPressed: () {
                },
                elevation: 2.0,
                fillColor:colorFromHEX('#AED6F1'),
                child: Icon(
                 Ionicons.logo_game_controller_b,
                  size: 35.0,
                  color: colorFromHEX('#21618C'),
                ),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                ),
              ),
          SizedBox(height: 5),
        Text('Usman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
            ),
            ),
          SizedBox(height: 5),
         Text('Most Games',
          style: TextStyle(
            color: colorFromHEX('#626567'),
            fontSize: 16,
            fontWeight: FontWeight.w600
            ),
            ),
          ],
          ),
            Column(children: <Widget>[
        RawMaterialButton(
                onPressed: () {
                },
                elevation: 2.0,
                fillColor: colorFromHEX('#ABEBC6'),
                child: Icon(
                 Ionicons.md_trophy,
                  size: 35.0,
                  color: colorFromHEX('#1D8348'),
                ),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                ),
              ),
             SizedBox(height: 5),
        Text('Safian',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
            ),
            ),
          SizedBox(height: 5),
         Text('Most Wins',
          style: TextStyle(
            color: colorFromHEX('#626567'),
            fontSize: 16,
            fontWeight: FontWeight.w600
            ),
            ),
          ],
          )
      ],
      ),
    );
  }
}