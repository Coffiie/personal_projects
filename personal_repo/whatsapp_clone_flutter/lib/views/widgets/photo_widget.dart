import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/data/data.dart';
import 'package:whatsapp_clone_flutter/theme/app_theme.dart';
import 'package:whatsapp_clone_flutter/views/widgets/profile_picture_widget.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  final List<String> storyThumnailPaths = const [
    'assets/cover1.jpg',
    'assets/cover2.jpg',
    'assets/cover3.jpg',
    'assets/cover4.jpg',
    'assets/cover5.jpg'
  ];
  final double threshold = 230;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // log(constraints.toString());
      double minHeight = constraints.minHeight * 0.4;
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: constraints.minHeight < threshold ? 16 : 4,
            vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: constraints.minHeight < threshold ? minHeight : 160,
              curve: Curves.easeOut,
              width: constraints.minHeight < threshold ? 55 : 115,
              decoration: ShapeDecoration(
                shape: constraints.minHeight < threshold
                    ? const CircleBorder()
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppTheme.green, AppTheme.blue]),
              ),
              child: Padding(
                padding: constraints.minHeight < threshold
                    ? const EdgeInsets.all(4.0)
                    : EdgeInsets.zero,
                child: AnimatedCrossFade(
                  sizeCurve: Curves.easeOut,
                  duration: const Duration(milliseconds: 1000),
                  crossFadeState: constraints.minHeight < threshold
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Hero(
                    tag: 'profile_pic',
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(imagePaths[index]))),
                        ),
                      ),
                    ),
                  ),
                  secondChild: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(microseconds: 1),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(storyThumnailPaths[index])),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: const [
                                0.0,
                                1.0
                              ],
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                              ]),
                        ),
                      ),
                      Positioned(
                          bottom: 32,
                          left: 16,
                          child: Hero(
                            tag: 'profile_pic',
                            child: ProfilePictureWidget(
                              image: imagePaths[index],
                            ),
                          )),
                      Positioned(
                        bottom: 10,
                        left: 16,
                        child: Text(
                          names[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            constraints.minHeight < threshold
                ? const SizedBox(height: 8)
                : Container(),
            AnimatedOpacity(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 200),
              opacity: constraints.minHeight < threshold ? 1 : 0,
              child: Text(
                names[index],
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }
}
