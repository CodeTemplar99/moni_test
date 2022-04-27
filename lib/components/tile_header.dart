// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

class tileHeader extends StatelessWidget {
  final String tileHeaderTitle;

  const tileHeader({
    Key? key,
    required this.tileHeaderTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tileHeaderTitle,
            style: TextStyle(
              color: text1,
              fontSize: 13.16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(Icons.remove),
        ],
      ),
    );
  }
}
