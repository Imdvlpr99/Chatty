import 'package:chatty/widget/custom_otp_field.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final ValueChanged<bool> isInputValid;

  const OtpInput({
    super.key,
    required this.isInputValid
  });

  @override
  State<StatefulWidget> createState() => OtpInputState();
}

class OtpInputState extends State<OtpInput> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();

  late bool isFocused1;
  late bool isFocused2;
  late bool isFocused3;
  late bool isFocused4;

  @override
  void initState() {
    super.initState();
    isFocused1 = true;
    isFocused2 = false;
    isFocused3 = false;
    isFocused4 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOtpField(
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
        const SizedBox(width: 10),
        CustomOtpField(
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
        const SizedBox(width: 10),
        CustomOtpField(
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
        const SizedBox(width: 10),
        CustomOtpField(
          controller: controller4,
          focusNode: focusNode4,
          autoFocus: false,
          isFocused: isFocused4,
          onChange: (String value) {
            setState(() {
              if (value.length == 1) {
              } else if (value.isEmpty) {
                focusNode3.requestFocus();
                isFocused3 = true;
                isFocused4 = false;
              }
            });
          },
        ),
      ],
    );
  }
}