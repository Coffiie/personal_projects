import 'package:flutter/material.dart';

class AmazingButton extends StatelessWidget {
  const AmazingButton({super.key});

  final buttonColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3, 4),
                        color: buttonColor,
                      ),
                    ]),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: buttonColor,
                    elevation: 0,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(
                      color: buttonColor,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('GET STARTED'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
