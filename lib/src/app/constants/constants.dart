import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const String appVersion = '1.0.1';
const String searchCity = 'Search City';

late Box database;
//Colors

const rainBlueLight = Color(0xFF4480C6);
const rainBlueDark = Color(0xFF364699);
const rainGradient = [rainBlueLight, rainBlueDark];
const accentColor = Color(0xFFe96e50);

//Assets
//Text style

final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
  BoxShadow(
    color: Colors.black12.withOpacity(0.25),
    spreadRadius: 1,
    blurRadius: 4,
    offset: const Offset(0, 2),
  )
]);

final iconData = (String iconUrl) {
  return "https://openweathermap.org/img/wn/${iconUrl}@2x.png";
};
