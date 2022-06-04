import 'package:flutter/material.dart';

class GridChild extends StatelessWidget {
  const GridChild(
      {Key? key,
      required this.imagePath,
      required this.count,
      required this.description})
      : super(key: key);
  final String imagePath;
  final String description;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath)),
              borderRadius: BorderRadius.circular(30)),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(count.toString())
      ],
    );
  }
}
