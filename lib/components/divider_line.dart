// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class dividerLine extends StatelessWidget {
  const dividerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20,
        child: Divider(
          color: Color(0xFF72777A),
        ));
  }
}
