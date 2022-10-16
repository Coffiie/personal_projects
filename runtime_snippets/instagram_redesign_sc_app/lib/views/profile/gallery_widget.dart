import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/data/data.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.image,
                  color: selectedIndex == 0
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.video,
                  color: selectedIndex == 1
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.cameraRetro,
                  color: selectedIndex == 2
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.link,
                  color: selectedIndex == 3
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.users,
                  color: selectedIndex == 4
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.bookmark,
                  color: selectedIndex == 5
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color,
                ),
              )
            ],
          ),
        ),
        const GalleryImageView()
      ],
    );
  }
}

class GalleryImageView extends StatelessWidget {
  const GalleryImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Image.asset(
                  imagePaths[0],
                  fit: BoxFit.cover,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset(
                  imagePaths[1],
                  fit: BoxFit.cover,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset(
                  imagePaths[2],
                  fit: BoxFit.cover,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset(
                  imagePaths[3],
                  fit: BoxFit.cover,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset(
                  imagePaths[4],
                  fit: BoxFit.cover,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset(
                  imagePaths[5],
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
