import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      {super.key,
      required this.icon,
      this.isSelected = false,
      required this.onTap});
  final IconData icon;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: isSelected
          ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!
          : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!,
      child: IconButton(
        onPressed: onTap,
        icon: FaIcon(icon),
      ),
    );
  }
}
