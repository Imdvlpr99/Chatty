import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final String title;
  final ValueChanged<bool> onValueChanged;
  final Color? uncheckColor;
  final Color? checkedColor;
  final Color? tickColor;

  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.title,
    required this.onValueChanged,
    this.uncheckColor,
    this.checkedColor,
    this.tickColor,
  });

  @override
  State<StatefulWidget> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (_isChecked == true) {
                _isChecked = false;
              } else {
                _isChecked = true;
              }
              widget.onValueChanged.call(_isChecked);
            });
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.isChecked ? widget.checkedColor ?? darkBlue : white,
              border: Border.all(
                color: widget.uncheckColor ?? darkBlue,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: widget.tickColor ?? white,
                size: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          widget.title,
          style: semiBold12spAshGrey,
        )
      ],
    );
  }

}