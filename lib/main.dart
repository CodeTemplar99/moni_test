// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moni_test/components/active_loan_tile.dart';
import 'package:moni_test/components/divider_line.dart';
import 'package:moni_test/components/due_today_loan_tile.dart';
import 'package:moni_test/components/inactive_loan_tile.dart';
import 'package:moni_test/components/overdue_loan_tile.dart';
import 'package:moni_test/components/text_with_background_color.dart';
import 'package:moni_test/components/tile_header.dart';
import 'package:moni_test/constant.dart';

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
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                flexibleSpace: Image(
                  image: AssetImage('assets/images/BG.png'),
                  fit: BoxFit.cover,
                ),
                backgroundColor: Colors.black,
                leading: Icon(Icons.arrow_back_rounded),
                title: Text(widget.title),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(260),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(17.0, 0, 17.0, 17.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Moni dreambig community',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            height: 2.4),
                                      ),
                                      textWithBackgroundColor(
                                        textTitle: 'Repayment Rate: ',
                                        textValue: '60%',
                                        textColor: secondaryBrandDarkest,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      textWithBackgroundColor(
                                        textTitle: 'Repayment Day: ',
                                        textValue: 'Every Sunday',
                                        textColor: greenLighter,
                                      ),
                                    ],
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/Avatar-Big.png'),
                                  width: 48,
                                  height: 48,
                                )
                              ],
                            ),
                            dividerLine(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cluster purse balance',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Text(
                                          '₦550,000,000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '+₦550,000,000 interest today',
                                        style: TextStyle(
                                          color: greenLighter,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('View purse'),
                                )
                              ],
                            ),
                            dividerLine(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total interest earned',
                                  style: TextStyle(
                                    color: greyBase,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '₦550,000,000',
                                  style: TextStyle(
                                    color: secondaryBrandDarkest,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            dividerLine(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total owed by members',
                                  style: TextStyle(
                                    color: greyBase,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '₦550,000,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xFFFDF8ED),
                        child: TabBar(
                          controller: _tabController,
                          tabs: [
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Members (9)',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Cluster Details',
                                  ),
                                ),
                              ),
                            ),
                          ],
                          // labelColor: Colors.black,
                          indicatorColor: Colors.grey,
                          labelColor: primaryBrandBase,
                          unselectedLabelColor: dark,
                          indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                        OverdueLoanTile('assets/images/Avatar-Big.png',
                            "Florence Tanika", 3, '₦10,555,000'),

                        // Due Today
                        tileHeader(
                          tileHeaderTitle: 'Due Today',
                        ),
                        DueTodayLoanTile('assets/images/Avatar-Big.png',
                            "Tiamiyu Adzan", 3, '₦10,555,000'),
                        DueTodayLoanTile('assets/images/Avatar-Big.png',
                            "Eze Tarka", 1, '₦10,555,000'),
                        tileHeader(
                          tileHeaderTitle: 'Active Loans',
                        ),
                        ActiveLoanTile('assets/images/Avatar-Big.png',
                            "Halima Yaya", 2, '₦10,555,000'),
                        ActiveLoanTile('assets/images/Avatar-Big.png',
                            "Uche Ngozi", 2, '₦10,555,000'),
                        ActiveLoanTile('assets/images/Avatar-Big.png',
                            "Anisa Lulu", 2, '₦10,555,000'),
                        tileHeader(
                          tileHeaderTitle: 'Inactive Loans',
                        ),
                        InactiveLoanTile(
                          'assets/images/Avatar-Big.png',
                          "Rebecca Funto",
                        ),
                        InactiveLoanTile(
                          'assets/images/Avatar-Big.png',
                          "Absko Gandhi",
                        ),
                        InactiveLoanTile(
                          'assets/images/Avatar-Big.png',
                          "Mensa Robert",
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Text('hello2'),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
