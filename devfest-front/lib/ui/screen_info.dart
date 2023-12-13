import 'package:flutter/material.dart';

class ScreenInfo{
  static late double width;
  static late double height;

  static const Color clrBg =  Color(0xFF191b21);
  static const Color clrBg2 =  Color(0xFF3d3e42);
  static const Color clrItemMain =  Colors.white;


  static TextStyle headline1({Color color=clrItemMain}) => TextStyle(
    fontFamily: "Lexend",
    fontWeight: FontWeight.bold,
    fontSize: ScreenInfo.height*0.04,
    color: color
  );

  static TextStyle headline2({Color color=clrItemMain}) => TextStyle(
    fontFamily: "Lexend",
    fontWeight: FontWeight.w500,
    fontSize: ScreenInfo.height*0.024,
    color: color
  );

  static TextStyle headline3({Color color=clrItemMain}) => TextStyle(
    fontFamily: "Lexend",
    fontWeight: FontWeight.w400,
    fontSize: ScreenInfo.height*0.019,
    color: color
  );

  static TextStyle headline4({Color color=clrItemMain}) => TextStyle(
    fontFamily: "Lexend",
    fontWeight: FontWeight.w500,
    fontSize: ScreenInfo.height*0.015,
    color: color
  );

}