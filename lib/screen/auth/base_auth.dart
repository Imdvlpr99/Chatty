import 'package:chatty/screen/auth/login.dart';
import 'package:chatty/screen/auth/register.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseAuth extends StatefulWidget {
  const BaseAuth({super.key});

  @override
  State<StatefulWidget> createState() => BaseAuthState();
}

class BaseAuthState extends State<BaseAuth> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  final List<Tab> _tabs = const [
    Tab(text: login,),
    Tab(text: register,)
  ];

  final List<Widget> _tabScreen = const [
    Login(),
    Register()
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
    SystemChrome.setSystemUIOverlayStyle(darkMode);
    return Scaffold(
        backgroundColor: blackSoft,
        body: SafeArea(
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
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            _selectedIndex == 0 ? loginTitle : registerTitle,
                            style: bold24spWhite,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            authDesc,
                            style: medium12spSmokeGrey,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                                height: 52,
                                decoration: BoxDecoration(
                                  color: softGrey,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [mainShadow],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TabBar(
                                    dividerColor: Colors.transparent,
                                    controller: _tabController,
                                    tabs: _tabs,
                                    labelStyle: semiBold14spDarkBlue,
                                    unselectedLabelStyle: medium14spAshGrey,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(48),
                                      boxShadow: [mainShadow],
                                    ),
                                    onTap: (index) {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 800
                                ),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: _tabScreen,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        )
    );
  }
}