// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

Widget InactiveLoanTile(pictureUrl, name) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Color(0xFFEBF1F9),
        ),
        bottom: BorderSide(
          color: Color(0xFFEBF1F9),
        ),
      ),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Image(
        image: AssetImage(pictureUrl),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: text1,
          fontSize: 13.16,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        'No active loan ',
        style: TextStyle(
          color: darkLighter,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
