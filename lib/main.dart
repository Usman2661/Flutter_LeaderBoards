import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaderboards/screens/games.dart';
import 'package:leaderboards/screens/home.dart';
import 'package:leaderboards/screens/loading.dart';
import 'package:leaderboards/screens/players.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
         runApp(MaterialApp(
          initialRoute: '/home',
          routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/games': (context) => Games(),
            '/players': (context) => Players(),
          },
        ));
    }); 
}