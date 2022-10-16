import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';
import 'package:instagram_redesign_sc_app/views/common/dots.dart';

class PostItem extends StatefulWidget {
  const PostItem(
      {super.key,
      required this.isMultiple,
      required this.backgroundImagePaths,
      required this.profileImagePath,
      required this.profileName});
  final String profileImagePath, profileName;
  final bool isMultiple;
  final List<String> backgroundImagePaths;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        widget.isMultiple
            ? Container(
                width: w,
                height: h * 0.7,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: PageView.builder(
                    itemCount: widget.backgroundImagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, i) {
                      return Image.asset(
                        widget.backgroundImagePaths[i],
                        fit: BoxFit.cover,
                      );
                    }),
              )
            : Container(
                width: w,
                height: h * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.backgroundImagePaths[0])),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25))),
              ),
        IgnorePointer(
          child: Container(
            width: w,
            height: h * 0.7,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.0,
                      0.5,
                      0.8
                    ],
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.transparent,
                      Colors.black.withOpacity(0.7)
                    ])),
          ),
        ),
        IgnorePointer(
          child: Container(
            width: w,
            height: h * 0.7,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.profileImagePath),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      widget.profileName,
                      style: const TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    widget.isMultiple
                        ? Dots(
                            selectedIndex: currentIndex,
                            indices: List.generate(
                                widget.backgroundImagePaths.length,
                                (index) => index),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.14),
                  child: Row(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.15)),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.transparent),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Row(
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    color: AppColors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '7.8k',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.solidCommentDots,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        '198',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const FaIcon(
                        FontAwesomeIcons.bookmark,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
