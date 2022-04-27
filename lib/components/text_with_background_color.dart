// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

class textWithBackgroundColor extends StatelessWidget {
  final String textValue;
  final String textTitle;
  final Color textColor;

  const textWithBackgroundColor({
    Key? key,
    required this.textValue,
    required this.textTitle,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      decoration: BoxDecoration(
          color: Color(0xFF090A0A), borderRadius: BorderRadius.circular(100)),
      child: RichText(
        text: TextSpan(
          text: textTitle,
          style: TextStyle(
            color: greyBase,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
                text: textValue,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
