// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable

import 'dart:io';

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
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          final TabController? _tabController =
              DefaultTabController.of(context);
          _tabController!.addListener(
            () {
              if (!_tabController.indexIsChanging) {}
            },
          );
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(300),
              child:
                  StickyAppBar(widget: widget, tabController: _tabController),
            ),
            body: SafeArea(
              child: TabBarView(controller: _tabController, children: [
                // this is the first tab view (members)
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
                            "Florence Tanika", 3, '???10,555,000'),

                        // Due Today
                        tileHeader(
                          tileHeaderTitle: 'Due Today',
                        ),
                        DueTodayLoanTile('assets/images/Avatar-2.png',
                            "Tiamiyu Adzan", 3, '???10,555,000'),
                        DueTodayLoanTile('assets/images/Avatar-3.png',
                            "Eze Tarka", 1, '???10,555,000'),
                        //  Active loans
                        tileHeader(
                          tileHeaderTitle: 'Active Loans',
                        ),
                        ActiveLoanTile('assets/images/Avatar-4.png',
                            "Halima Yaya", 2, '???10,555,000'),
                        ActiveLoanTile('assets/images/Avatar-5.png',
                            "Uche Ngozi", 2, '???10,555,000'),
                        ActiveLoanTile('assets/images/Avatar-6.png',
                            "Anisa Lulu", 2, '???10,555,000'),
                        // Inactive loans
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

                // this is the second tab view (cluster details)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // cluster purse setting
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
                                '???550,000,000',
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

                        //  Group invite link/code
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Member invite code',
                                        style: TextStyle(
                                            color: darker,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Share.share(
                                              'Hello, join me on https://app.moni.com/30DF38TG000');
                                        },
                                        child: Text(
                                          '30DF38TG000',
                                          style: TextStyle(
                                              color: darker,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 1.9),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Get new code',
                                    style: TextStyle(
                                        color: primaryBrandBase,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Loan settings
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
                                '???550,000,000',
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

                        //  Pending join request
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

                        // Group settings
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
                                    'Check the car???s rental terms as well, because\neach company has its own rules.',
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
                                    'Check the car???s rental terms as well, because\neach company has its own rules.',
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
                              GestureDetector(
                                onTap: () => openwhatsapp(),
                                child: Text(
                                  'https://chat.whatsapp.com/BmK1mYu9zGAGh\nhqi8xqQQ5',
                                  style: TextStyle(
                                    color: greenDarkest,
                                    fontSize: 13.16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                  ),
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

                        // Benefits earned
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
                                '???550,000,000',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        '???550,000,000',
                                        style: TextStyle(
                                            color: darker,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            height: 1.9),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '+???5000 today',
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
            ),
          );
        },
      ),
    );
  }

// launch WhatsApp supports iOS, Android and Web
  openwhatsapp() async {
    String whatsapp = "+2348135536304";
    String whatsappURlAndroid = "whatsapp://send?phone=" +
        whatsapp +
        "&text=Hello Chiadika, we've viewed your submission";
    String whatappURLIos =
        "https://wa.me/$whatsapp?text=${Uri.parse("Hello Chiadika, we've viewed your submission")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrlString(whatappURLIos)) {
        await launchUrlString(whatappURLIos);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrlString(whatsappURlAndroid)) {
        await launchUrlString(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("whatsapp not installed")));
      }
    }
  }
}
