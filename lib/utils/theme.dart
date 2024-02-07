import 'dart:ui';

import 'package:chatty/utils/color.dart';
import 'package:flutter/cupertino.dart';

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