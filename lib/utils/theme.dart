import 'package:chatty/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/** System UI **/
const SystemUiOverlayStyle darkMode = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
);
const SystemUiOverlayStyle lightMode = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
);

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

final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
  backgroundColor: white,
  elevation: 0,
  side: const BorderSide(
      width: 1,
      color: grey
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  )
);

/** Text Style **/
final TextStyle medium12spSmokeGrey = GoogleFonts.poppins().copyWith(
    color: smokeGrey,
    fontWeight: FontWeight.w500,
    fontSize: 12
);

final TextStyle medium14spAshGrey = GoogleFonts.poppins().copyWith(
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

final TextStyle semiBold16spWhite = GoogleFonts.poppins().copyWith(
    color: white,
    fontWeight: FontWeight.w600,
    fontSize: 16
);

final TextStyle bold16spWhite = GoogleFonts.poppins().copyWith(
  color: white,
  fontWeight: FontWeight.bold,
  fontSize: 16
);

final TextStyle bold24spWhite = GoogleFonts.poppins().copyWith(
    color: white,
    fontWeight: FontWeight.bold,
    fontSize: 24
);

final TextStyle bold24spBlack = GoogleFonts.poppins().copyWith(
    color: black,
    fontWeight: FontWeight.bold,
    fontSize: 24
);

final TextStyle regular14spDarkBlue = GoogleFonts.poppins().copyWith(
    color: darkBlue,
    fontWeight: FontWeight.w400,
    fontSize: 14
);

final TextStyle regular18spAshGrey = GoogleFonts.poppins().copyWith(
    color: ashGrey,
    fontWeight: FontWeight.w400,
    fontSize: 18
);