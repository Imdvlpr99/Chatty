import 'package:chatty/widget/custom_otp_field.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<StatefulWidget> createState() => OtpInputState();
}

class OtpInputState extends State<OtpInput> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();

  late bool isFocused1;
  late bool isFocused2;
  late bool isFocused3;
  late bool isFocused4;
  late bool isFocused5;
  late bool isFocused6;

  @override
  void initState() {
    super.initState();
    isFocused1 = true;
    isFocused2 = false;
    isFocused3 = false;
    isFocused4 = false;
    isFocused5 = false;
    isFocused6 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CustomOtpField(
            controller: controller1,
            focusNode: focusNode1,
            autoFocus: true,
            isFocused: isFocused1,
            onChange: (String value) {
              setState(() {
                if (value.length == 1) {
                  focusNode2.requestFocus();
                  isFocused1 = false;
                  isFocused2 = true;
                }
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CustomOtpField(
            controller: controller2,
            focusNode: focusNode2,
            autoFocus: false,
            isFocused: isFocused2,
            onChange: (String value) {
              setState(() {
                if (value.length == 1) {
                  focusNode3.requestFocus();
                  isFocused2 = false;
                  isFocused3 = true;
                } else if (value.isEmpty) {
                  focusNode1.requestFocus();
                  isFocused1 = true;
                  isFocused2 = false;
                }
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CustomOtpField(
            controller: controller3,
            focusNode: focusNode3,
            autoFocus: false,
            isFocused: isFocused3,
            onChange: (String value) {
              setState(() {
                if (value.length == 1) {
                  focusNode4.requestFocus();
                  isFocused3 = false;
                  isFocused4 = true;
                } else if (value.isEmpty) {
                  focusNode2.requestFocus();
                  isFocused2 = true;
                  isFocused3 = false;
                }
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CustomOtpField(
            controller: controller4,
            focusNode: focusNode4,
            autoFocus: false,
            isFocused: isFocused4,
            onChange: (String value) {
              setState(() {
                if (value.length == 1) {
                  focusNode5.requestFocus();
                  isFocused4 = false;
                  isFocused5 = true;
                } else if (value.isEmpty) {
                  focusNode3.requestFocus();
                  isFocused3 = true;
                  isFocused4 = false;
                }
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CustomOtpField(
            controller: controller5,
            focusNode: focusNode5,
            autoFocus: false,
            isFocused: isFocused5,
            onChange: (String value) {
              setState(() {
                if (value.length == 1) {
                  focusNode6.requestFocus();
                  isFocused5 = false;
                  isFocused6 = true;
                } else if (value.isEmpty) {
                  focusNode4.requestFocus();
                  isFocused4 = true;
                  isFocused5 = false;
                }
              });
            },
          ),
        ),
        CustomOtpField(
          controller: controller6,
          focusNode: focusNode6,
          autoFocus: false,
          isFocused: isFocused6,
          onChange: (String value) {
            setState(() {
              if (value.length == 1) {
              } else if (value.isEmpty) {
                focusNode5.requestFocus();
                isFocused5 = true;
                isFocused6 = false;
              }
            });
          },
        )
      ],
    );
  }
}