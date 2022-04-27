// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

class ClusterLinkTextRow extends StatelessWidget {
  final String firstLineText;

  final String secondLineText;

  final double secondLineSize;

  final String linkText;

  final Color secondLineColor;

  final double firstLineSize;

  final Color firstLineColor;

  const ClusterLinkTextRow({
    Key? key,
    required this.firstLineText,
    required this.secondLineText,
    required this.secondLineSize,
    required this.linkText,
    required this.secondLineColor,
    required this.firstLineSize,
    required this.firstLineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstLineText,
              style: TextStyle(
                color: firstLineColor,
                fontSize: firstLineSize,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              secondLineText,
              style: TextStyle(
                color: secondLineColor,
                fontSize: secondLineSize,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => print('tapped'),
          child: Text(
            linkText,
            style: TextStyle(
              color: primaryBrandBase,
              fontSize: 13.16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
