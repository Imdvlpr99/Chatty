import 'package:chatty/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/** Linear Color **/
LinearGradient mainBackground() {
  return const LinearGradient(
      colors: [
        black,
        darkBlue,
      ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );
}

/** Button Style **/
final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  backgroundColor: darkBlue,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(32))
  )
);

/** Text Style **/
final TextStyle medium14spAshGray = GoogleFonts.poppins().copyWith(
    color: ashGrey,
    fontWeight: FontWeight.w500,
    fontSize: 14
);

final TextStyle semiBold12spDarkBlue = GoogleFonts.poppins().copyWith(
    color: darkBlue,
    fontWeight: FontWeight.w600,
    fontSize: 12
);

final TextStyle semiBold12spAshGrey = GoogleFonts.poppins().copyWith(
    color: ashGrey,
    fontWeight: FontWeight.w600,
    fontSize: 12
);

final TextStyle semiBold14spDarkBlue = GoogleFonts.poppins().copyWith(
    color: darkBlue,
    fontWeight: FontWeight.w600,
    fontSize: 14
);

final TextStyle bold16spWhite = GoogleFonts.poppins().copyWith(
  color: white,
  fontWeight: FontWeight.bold,
  fontSize: 16
);

final TextStyle regular14spDarkBlue = GoogleFonts.poppins().copyWith(
    color: darkBlue,
    fontWeight: FontWeight.w400,
    fontSize: 14
);