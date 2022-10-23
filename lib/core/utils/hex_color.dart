import 'package:flutter/material.dart';

class HexColor extends Color{
  static int _getColotFromHex(String hexColor){
    hexColor = hexColor.toLowerCase().replaceAll("#", "");
    if(hexColor.length == 6){
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor,radix: 16);
  }
  HexColor(final String hexColor) : super(_getColotFromHex(hexColor));

}