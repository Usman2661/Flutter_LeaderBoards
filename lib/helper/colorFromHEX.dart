import 'package:flutter/cupertino.dart';


  Color colorFromHEX(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
  }

