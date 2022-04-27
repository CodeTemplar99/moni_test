// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

Widget DueTodayLoanTile(pictureUrl, name, overdueValue, overdueAmountText) {
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
      title: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              color: text1,
              fontSize: 13.16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 4,
            width: 4,
            decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(50)),
          ),
          Text(
            '$overdueValue days over due',
            style: TextStyle(
              color: yellowDarkest,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      subtitle: Text(
        '$overdueAmountText Late loan ',
        style: TextStyle(
          color: yellowDarkest,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
