import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomOtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool autoFocus;
  final bool isFocused;
  final ValueChanged<String> onChange;

  const CustomOtpField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChange,
    this.autoFocus = false,
    this.isFocused = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isFocused ? darkBlue : grey,
            width: 2.5,
          )
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autoFocus,
          keyboardType: TextInputType.number,
          style: medium32spWhite,
          maxLength: 1,
          textAlign: TextAlign.center,
          onChanged: (String value) {
            onChange.call(value);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            counterText: '',
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

}