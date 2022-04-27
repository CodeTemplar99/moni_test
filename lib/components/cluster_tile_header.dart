// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moni_test/constant.dart';

class ClusterTileHeader extends StatelessWidget {
  final String tileHeaderTitle;

  final String clusterHeaderIcon;

  const ClusterTileHeader({
    Key? key,
    required this.tileHeaderTitle,
    required this.clusterHeaderIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage(clusterHeaderIcon)),
          SizedBox(
            width: 9,
          ),
          Text(
            tileHeaderTitle,
            style: TextStyle(
              color: darker,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
