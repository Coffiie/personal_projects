import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({Key? key, required this.label, this.horizontalPadding = 0})
      : super(key: key);
  final Widget label;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Chip(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 8 + horizontalPadding),
        label: label);
  }
}
