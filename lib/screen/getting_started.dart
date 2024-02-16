import 'package:chatty/screen/auth/base_auth.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/custom_page_route.dart';
import 'package:chatty/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/shared_preference.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<StatefulWidget> createState() => GettingStartedState();
}

class GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/getting_started_light.svg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 42),
                    child: Text(
                      gettingStarted,
                      textAlign: TextAlign.center,
                      style: bold24spBlack,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 50),
                    child: Text(
                      gettingStartedDesc,
                      textAlign: TextAlign.center,
                      style: regular18spAshGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        CustomPageRoute(
                            child: const BaseAuth(),
                            direction: AxisDirection.left
                        )
                    );
                    await SharedPreferencesUtils.setBoolean(isNotFirstInstall, true);
                  },
                  child: Text(
                    startMessaging,
                    style: semiBold16spWhite,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

}