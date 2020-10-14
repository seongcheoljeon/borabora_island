import 'package:flutter/material.dart';

class Style {
  static final TextStyle baseTextStyle = new TextStyle(fontFamily: 'Poppins');
  static final TextStyle commonTextStyle = baseTextStyle.copyWith(
    color: Colors.white70,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final TextStyle titleTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );

  static Style _instance = new Style();

  factory Style() {
    return _instance;
  }
}
