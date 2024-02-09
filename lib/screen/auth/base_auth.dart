import 'package:chatty/screen/auth/login.dart';
import 'package:chatty/screen/auth/register.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseAuth extends StatefulWidget {
  const BaseAuth({super.key});

  @override
  State<StatefulWidget> createState() => BaseAuthState();
}

class BaseAuthState extends State<BaseAuth> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<Tab> _tabs = [
    const Tab(text: login,),
    const Tab(text: register,)
  ];

  final List<Widget> _tabScreen = [
    const Login(),
    const Register()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackSoft,
      body: Column(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: SvgPicture.asset(
                        'assets/images/header_bg.svg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      )
                  ),
                  Positioned(
                      top: 270,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(40))
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                              height: 52,
                              decoration: BoxDecoration(
                                  color: softGray,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: softGray.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3), // Offset
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TabBar(
                                  dividerColor: Colors.transparent,
                                  controller: _tabController,
                                  tabs: _tabs,
                                  labelStyle: semiBold14spDarkBlue,
                                  unselectedLabelStyle: medium14spAshGray,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(48)
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: _tabScreen,
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              )
          )
        ],
      )
    );
  }

}