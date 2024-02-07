import 'package:chatty/utils/color.dart';
import 'package:chatty/widget/nav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final List<NavItem> menuList;
  final ValueChanged<int> onMenuChange;
  final Color activeColor;
  final Color color;
  final Color? backgroundColor;
  final int selectedIndex;
  final double gap;

  const CustomNavBar({
    super.key,
    required this.menuList,
    required this.onMenuChange,
    required this.activeColor,
    required this.color,
    this.backgroundColor,
    this.selectedIndex = 0,
    this.gap = 0
  });

  @override
  State<StatefulWidget> createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  var selectedIndex = 0;
  bool clickable = true;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor?? white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.menuList.map((i) =>
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.gap),
                child: NavItem(
                  icon: i.icon,
                  menuName: i.menuName,
                  activeColor: widget.activeColor,
                  color: widget.color,
                  isActive: selectedIndex == widget.menuList.indexOf(i),
                ),
              ),
              onTap: () {
                if (!clickable) return;
                setState(() {
                  selectedIndex = widget.menuList.indexOf(i);
                  clickable = false;
                });

                widget.onMenuChange.call(selectedIndex);

                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    clickable = true;
                  });
                });
              },
            )
        ).toList(),
      ),
    );
  }

}