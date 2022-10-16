import 'package:flutter/material.dart';
import 'package:instagram_redesign_sc_app/utils/utils.dart';

class ActivityButton extends StatelessWidget {
  const ActivityButton(
      {super.key,
      required this.buttonText,
      required this.isSelected,
      required this.onPressed,
      this.amount = 0});

  final int amount;
  final bool isSelected;
  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Utils().isDark(context)
                        ? isSelected
                            ? Colors.white
                            : Colors.grey.withOpacity(0.3)
                        : isSelected
                            ? Colors.black
                            : Colors.white),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: Utils().isDark(context)
                          ? isSelected
                              ? Colors.black
                              : Colors.white
                          : isSelected
                              ? Colors.white
                              : Colors.black),
                ))
          ],
        ),
        amount == 0
            ? const SizedBox.shrink()
            : Positioned.fill(
                child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    '$amount',
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ))
      ],
    );
  }
}
