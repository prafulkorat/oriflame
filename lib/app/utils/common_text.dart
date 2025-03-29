import 'package:flutter/material.dart';

CommonText commonText = CommonText();

class CommonText {
  statictext({String text = '', double fontSize = 14.0, FontWeight fontWeight = FontWeight.normal, Color color = Colors.black, maxLines}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines ?? 100,
      overflow: TextOverflow.ellipsis,
    );
  }
}
