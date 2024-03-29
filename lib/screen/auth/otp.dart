import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:chatty/widget/otp_input.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<StatefulWidget> createState() => OtpState();
}

class OtpState extends State<Otp> {
  late bool isInputValid;

  @override
  void initState() {
    super.initState();
    isInputValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Column(
                children: [
                  OtpInput(
                    isInputValid: (bool value) {
                      setState(() {
                        isInputValid = value;
                      });
                    },
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                style: buttonPrimary,
                onPressed: isInputValid ? () {

                } : null,
                child: Text(
                  validateOtp,
                  style: bold16spWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}