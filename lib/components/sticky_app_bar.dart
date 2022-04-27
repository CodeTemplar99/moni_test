// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:moni_test/components/divider_line.dart';
import 'package:moni_test/components/text_with_background_color.dart';
import 'package:moni_test/constant.dart';
import 'package:moni_test/main.dart';
import 'package:moni_test/screens/home_page.dart';

class StickyAppBar extends StatelessWidget {
  const StickyAppBar({
    Key? key,
    required this.widget,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final MyHomePage widget;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        image: AssetImage('assets/images/Avatar-Big.png'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cluster Purse Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
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
                          child: Text('View Purse'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE66652),
                          ))
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
                    child: SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          'Members (9)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          'Cluster Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
