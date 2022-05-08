import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [
              0.1,
              0.5,
              0.9
            ],
            colors: [
              Color.fromARGB(255, 31, 66, 58),
              // Colors.black,
              Color.fromARGB(255, 30, 36, 34),
              Color.fromARGB(255, 31, 66, 58),
            ]),
      ),
    ));
  }
}
