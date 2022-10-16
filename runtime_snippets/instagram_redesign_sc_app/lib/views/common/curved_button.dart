import 'package:flutter/material.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';

class CurvedButton extends StatelessWidget {
  const CurvedButton(
      {super.key,
      this.addText = 'My Story',
      required this.isAdd,
      required this.imagePath,
      this.hasInstaBorders = true,
      this.hasText = true,
      this.isProfileImage = false,
      required this.name});
  final double kWidgetSize = 20;
  final bool isAdd, hasText, isProfileImage, hasInstaBorders;
  final String addText, imagePath, name;

  @override
  Widget build(BuildContext context) {
    if (isAdd) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.darkGrey),
            ),
            child: Padding(
              padding: EdgeInsets.all(kWidgetSize),
              child: const Icon(Icons.add),
            ),
          ),
          const Spacer(),
          Text(
            addText,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      );
    }
    if (hasText) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            _CurvedButton(
              hasInstaBorders: hasInstaBorders,
              kWidgetSize: kWidgetSize,
              imagePath: imagePath,
            ),
            const Spacer(),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    } else {
      if (isProfileImage) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _CurvedButton(
                hasInstaBorders: hasInstaBorders,
                kWidgetSize: kWidgetSize,
                imagePath: imagePath,
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.5,
                          0.9
                        ],
                        colors: [
                          AppColors.instagramTopGradient,
                          AppColors.instagramBottomGradient
                        ])),
                child: const Icon(
                  Icons.add,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ))
          ],
        );
      } else {
        return _CurvedButton(
            kWidgetSize: kWidgetSize,
            hasInstaBorders: hasInstaBorders,
            imagePath: imagePath);
      }
    }
  }
}

class _CurvedButton extends StatelessWidget {
  const _CurvedButton(
      {required this.kWidgetSize,
      required this.hasInstaBorders,
      required this.imagePath});
  final double kWidgetSize;
  final bool hasInstaBorders;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //in order to have constraints exactly like the add icon widget
        //we make sure to wrap it in a stack and make other widgets
        //fill to the constraints of the add icon widget
        //achieved through Positioned.fill()

        Opacity(
          opacity: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.darkGrey),
            ),
            child: Padding(
              padding: EdgeInsets.all(kWidgetSize),
              child: const Icon(Icons.add),
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: hasInstaBorders
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                          0.5,
                          0.9
                        ],
                      colors: [
                          AppColors.instagramTopGradient,
                          AppColors.instagramBottomGradient
                        ])
                  : null),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
        ))
      ],
    );
  }
}
