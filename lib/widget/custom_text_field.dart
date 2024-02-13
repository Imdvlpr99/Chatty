import 'package:flutter/material.dart';
import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final IconData? prefix;
  final bool isObscureText;
  final int? maxLines;
  final int? minLines;
  final String obscureChar;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textInputType,
    this.isObscureText = false,
    this.prefix,
    this.maxLines,
    this.minLines,
    this.obscureChar = '•',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: softGrey,
          width: 1,
        ),
        boxShadow: [
          mainShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  prefix,
                  size: 24,
                  color: darkBlue,
                ),
              ),
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: textInputType,
                obscureText: isObscureText,
                obscuringCharacter: obscureChar,
                style: regular14spDarkBlue,
                maxLines: isObscureText ? 1 : maxLines,
                minLines: minLines,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: labelText,
                  hintStyle: medium14spAshGrey,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}