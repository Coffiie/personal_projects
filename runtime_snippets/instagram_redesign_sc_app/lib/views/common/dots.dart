import 'package:flutter/material.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';

class Dots extends StatelessWidget {
  Dots(
      {super.key, required this.selectedIndex, this.indices = const [0, 1, 2]});
  final int selectedIndex;

  final Color disabledColor = AppColors.white.withOpacity(0.5);
  final Color enabledColor = AppColors.white;

  final List<int> indices;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: indices
          .map((i) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: AnimatedContainer(
                  height: 5,
                  width: i == selectedIndex ? 20 : 10,
                  curve: Curves.easeOutCubic,
                  duration: const Duration(milliseconds: 600),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? i == selectedIndex
                              ? disabledColor
                              : enabledColor
                          : i == selectedIndex
                              ? enabledColor
                              : disabledColor),
                ),
              ))
          .toList(),
    );
  }
}
