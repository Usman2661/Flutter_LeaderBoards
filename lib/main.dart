import 'package:flutter/material.dart';
import 'package:leaderboards/screens/home.dart';
import 'package:leaderboards/screens/loading.dart';

void main(){
     runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}