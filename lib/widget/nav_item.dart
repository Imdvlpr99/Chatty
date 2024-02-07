import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String menuName;
  final Color? activeColor;
  final Color? color;
  final bool? isActive;

  const NavItem({
    super.key,
    required this.icon,
    required this.menuName,
    this.activeColor,
    this.color,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 26,
          color: isActive! ? activeColor : color,
        ),
        const SizedBox(height: 10),
        Text(
          menuName,
          style: GoogleFonts.poppins().copyWith(
            color: isActive == true ? activeColor : color,
            fontSize: 16,
            fontWeight: isActive == true ? FontWeight.w600 : FontWeight.w400
          ),
        )
      ],
    );
  }

}