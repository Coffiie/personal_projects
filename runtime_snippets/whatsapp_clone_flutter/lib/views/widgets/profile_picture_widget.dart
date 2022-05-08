import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget(
      {Key? key, required this.image, this.size = 45, this.hasStory = true})
      : super(key: key);
  final String image;
  final double? size;
  final bool? hasStory;

  @override
  Widget build(BuildContext context) {
    if (hasStory!) {
      return Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 66, 193, 82),
                Color.fromARGB(255, 39, 110, 237),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    image: DecorationImage(
                        fit: BoxFit.contain, image: AssetImage(image))),
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: ShapeDecoration(
              shape: const CircleBorder(),
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage(image))),
        ),
      ),
    );
  }
}
