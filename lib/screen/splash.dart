import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/custom_page_route.dart';
import 'main/base.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    navigateToBase(context);
  }

  navigateToBase(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(
            child: const Base(),
            direction: AxisDirection.left),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/anim/splash.json',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

}