// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moni_test/components/active_loan_tile.dart';
import 'package:moni_test/components/cluster_link_text_row.dart';
import 'package:moni_test/components/cluster_tile_header.dart';
import 'package:moni_test/components/due_today_loan_tile.dart';
import 'package:moni_test/components/inactive_loan_tile.dart';
import 'package:moni_test/components/overdue_loan_tile.dart';
import 'package:moni_test/components/sticky_app_bar.dart';
import 'package:moni_test/components/tile_header.dart';
import 'package:moni_test/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List<Tab> tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          final TabController? tabController = DefaultTabController.of(context);
          tabController!.addListener(
            () {
              if (!tabController.indexIsChanging) {}
            },
          );
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(300),
                child: StickyAppBar(
                    widget: widget, tabController: _tabController)),
            body: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 17.0),
                  child: Column(
                    children: [
                      // Overdue loans
                      tileHeader(
                        tileHeaderTitle: 'Overdue Loans',
                      ),
                      OverdueLoanTile('assets/images/Avatar-1.png',
                          "Florence Tanika", 3, '₦10,555,000'),

                      // Due Today
                      tileHeader(
                        tileHeaderTitle: 'Due Today',
                      ),
                      DueTodayLoanTile('assets/images/Avatar-2.png',
                          "Tiamiyu Adzan", 3, '₦10,555,000'),
                      DueTodayLoanTile('assets/images/Avatar-3.png',
                          "Eze Tarka", 1, '₦10,555,000'),
                      tileHeader(
                        tileHeaderTitle: 'Active Loans',
                      ),
                      ActiveLoanTile('assets/images/Avatar-4.png',
                          "Halima Yaya", 2, '₦10,555,000'),
                      ActiveLoanTile('assets/images/Avatar-5.png',
                          "Uche Ngozi", 2, '₦10,555,000'),
                      ActiveLoanTile('assets/images/Avatar-6.png',
                          "Anisa Lulu", 2, '₦10,555,000'),
                      tileHeader(
                        tileHeaderTitle: 'Inactive Loans',
                      ),
                      InactiveLoanTile(
                        'assets/images/Avatar-7.png',
                        "Rebecca Funto",
                      ),
                      InactiveLoanTile(
                        'assets/images/Avatar-8.png',
                        "Absko Gandhi",
                      ),
                      InactiveLoanTile(
                        'assets/images/Avatar-9.png',
                        "Mensa Robert",
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overdue loans
                      ClusterTileHeader(
                        tileHeaderTitle: 'Cluster purse setting',
                        clusterHeaderIcon: 'assets/icons/badge-dollar.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7, bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBF1F9),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClusterLinkTextRow(
                              firstLineText: 'Frequency of contribution',
                              linkText: 'Change',
                              secondLineSize: 16,
                              secondLineText: 'Monthly upfront ',
                              firstLineColor: dark,
                              firstLineSize: 14,
                              secondLineColor: darker,
                            ),
                            Text(
                              '₦550,000,000',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.8),
                            ),
                            Text(
                              'Your contribution is 8% of your eligible amount ',
                              style: TextStyle(
                                  color: greydark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.8),
                            ),
                          ],
                        ),
                      ),
                      ClusterTileHeader(
                        tileHeaderTitle: 'Group Invite Link/Code',
                        clusterHeaderIcon: 'assets/icons/link.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBF1F9),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Use the link or code below to invite new member',
                              style: TextStyle(
                                  color: greydark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ClusterLinkTextRow(
                              firstLineText: 'Member invite code',
                              linkText: 'Get new code',
                              secondLineSize: 16,
                              secondLineText: '30DF38TG000',
                              firstLineColor: dark,
                              firstLineSize: 14,
                              secondLineColor: darker,
                            ),
                          ],
                        ),
                      ),
                      ClusterTileHeader(
                        tileHeaderTitle: 'Loan Setting',
                        clusterHeaderIcon: 'assets/icons/task-list.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBF1F9),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total loan collected by cluster',
                              style: TextStyle(
                                  color: greydark,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                            Text(
                              '₦550,000,000',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ClusterLinkTextRow(
                              firstLineText: 'Repayment Day',
                              linkText: 'Change',
                              secondLineText: 'Every Monday',
                              secondLineSize: 14,
                              firstLineColor: dark,
                              firstLineSize: 12,
                              secondLineColor: darker,
                            ),
                          ],
                        ),
                      ),
                      ClusterTileHeader(
                        tileHeaderTitle: 'Pending Join Request',
                        clusterHeaderIcon: 'assets/icons/task-list.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBF1F9),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No pending cluster join request',
                              style: TextStyle(
                                  color: greydark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2),
                            ),
                          ],
                        ),
                      ),
                      ClusterTileHeader(
                        tileHeaderTitle: 'Group Settings',
                        clusterHeaderIcon: 'assets/icons/biking-mountain.png',
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFEBF1F9),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Group rules',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2),
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('1.'),
                                Text(
                                  'Check the car’s rental terms as well, because\neach company has its own rules.',
                                  style: TextStyle(
                                      color: dark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('2.'),
                                Text(
                                  'Check the car’s rental terms as well, because\neach company has its own rules.',
                                  style: TextStyle(
                                      color: dark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2),
                                ),
                              ],
                            ),
                            Text(
                              'Group WhatsApp',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 2.5),
                            ),
                            Text(
                              'https://chat.whatsapp.com/BmK1mYu9zGAGh\nhqi8xqQQ5',
                              style: TextStyle(
                                color: greenDarkest,
                                fontSize: 13.16,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/icons/edit.png'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Edit Settings',
                                  style: TextStyle(
                                      color: primaryBrandBase, fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      ClusterTileHeader(
                        tileHeaderTitle: 'Benefits earned',
                        clusterHeaderIcon: 'assets/icons/money-bill.png',
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total CH benefits earned',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3),
                            ),
                            Text(
                              '₦550,000,000',
                              style: TextStyle(
                                  color: darker,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.9),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Available Benefits',
                                      style: TextStyle(
                                          color: darker,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3),
                                    ),
                                    Text(
                                      '₦550,000,000',
                                      style: TextStyle(
                                          color: darker,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          height: 1.9),
                                    ),
                                  ],
                                ),
                                Text(
                                  '+₦5000 today',
                                  style: TextStyle(
                                      color: Color(0xFF23C16B),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: primaryBrandBase,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'View earning history',
                                  style: TextStyle(
                                      color: primaryBrandBase,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
