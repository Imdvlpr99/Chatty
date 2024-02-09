import 'package:chatty/screen/main/calls.dart';
import 'package:chatty/screen/main/contacts.dart';
import 'package:chatty/screen/main/messages.dart';
import 'package:chatty/screen/main/settings.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:chatty/widget/custom_nav_bar.dart';
import 'package:chatty/widget/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<StatefulWidget> createState() => BaseState();

}

class BaseState extends State<Base> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  static final List<Widget> _navScreen = <Widget> [
    const Messages(),
    const Calls(),
    const Contacts(),
    const Settings()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: mainBackground(),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: _navScreen,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: CustomNavBar(
                    activeColor: darkBlue,
                    color: ashGrey,
                    selectedIndex: _selectedIndex,
                    gap: 8,
                    menuList: [
                      NavItem(
                        icon: _selectedIndex == 0 ? Iconsax.message5 : Iconsax.message,
                        menuName: messages,
                      ),
                      NavItem(
                        icon: _selectedIndex == 1 ? Iconsax.call_calling5 : Iconsax.call_calling,
                        menuName: calls,
                      ),
                      NavItem(
                        icon: _selectedIndex == 2 ? Iconsax.profile_circle5 : Iconsax.profile_circle,
                        menuName: contacts,
                      ),
                      NavItem(
                        icon: _selectedIndex == 3 ? Iconsax.setting_45 : Iconsax.setting_4,
                        menuName: settings,
                      ),
                    ],
                    onMenuChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}