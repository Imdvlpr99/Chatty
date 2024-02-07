import 'package:chatty/screen/main/calls.dart';
import 'package:chatty/screen/main/contacts.dart';
import 'package:chatty/screen/main/messages.dart';
import 'package:chatty/screen/main/settings.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
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
  static final List<Widget> _navScreen = <Widget> [
    const Messages(),
    const Calls(),
    const Contacts(),
    const Settings()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _navScreen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
        ),
        child: CustomNavBar(
          activeColor: darkBlue,
          color: ashGrey,
          selectedIndex: _selectedIndex,
          gap: 8,
          menuList: const [
            NavItem(
              icon: Iconsax.message,
              menuName: messages,
            ),
            NavItem(
                icon: Iconsax.call_calling,
                menuName: calls
            ),
            NavItem(
                icon: Iconsax.profile_circle,
                menuName: contacts
            ),
            NavItem(
                icon: Iconsax.setting_4,
                menuName: settings
            )
          ],
          onMenuChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

}