// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moni_test/components/active_loan_tile.dart';
import 'package:moni_test/components/cluster_link_text_row.dart';
import 'package:moni_test/components/cluster_tile_header.dart';
import 'package:moni_test/components/divider_line.dart';
import 'package:moni_test/components/due_today_loan_tile.dart';
import 'package:moni_test/components/inactive_loan_tile.dart';
import 'package:moni_test/components/overdue_loan_tile.dart';
import 'package:moni_test/components/sticky_app_bar.dart';
import 'package:moni_test/components/text_with_background_color.dart';
import 'package:moni_test/components/tile_header.dart';
import 'package:moni_test/constant.dart';
import 'package:moni_test/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My cluster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My cluster'),
    );
  }
}
