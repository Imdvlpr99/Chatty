import 'package:chatty/screen/auth/base_auth.dart';
import 'package:chatty/screen/auth/getting_started.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/custom_page_route.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  late bool isFirstInstall;

  @override
  void initState() {
    super.initState();
    _getFirstInstall();
  }

  Future<void> _getFirstInstall() async {
    isFirstInstall = await SharedPreferencesUtils.getBoolean(isNotFirstInstall);
    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstInstall) {
        navigateToBase();
      } else {
        navigateToOnboarding();
      }
    });
  }

  void navigateToBase() {
    Navigator.pushReplacement(
      context,
      CustomPageRoute(
        child: const BaseAuth(),
      ),
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacement(
      context,
      CustomPageRoute(
        child: const GettingStarted(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/anim/splash_light.json',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }

}