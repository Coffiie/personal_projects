import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/views/activity/activity_view.dart';
import 'package:instagram_redesign_sc_app/views/common/bottom_bar_item.dart';
import 'package:instagram_redesign_sc_app/views/home/home_view.dart';
import 'package:instagram_redesign_sc_app/views/profile/profile_view.dart';

class ParentView extends StatefulWidget {
  const ParentView({super.key});

  @override
  State<ParentView> createState() => _ParentViewState();
}

class _ParentViewState extends State<ParentView> {
  final pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 30,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BottomAppBar(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomBarItem(
                    icon: FontAwesomeIcons.house,
                    isSelected: pageIndex == 0,
                    onTap: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOutCubic);
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                  ),
                  BottomBarItem(
                    icon: FontAwesomeIcons.magnifyingGlass,
                    onTap: () {},
                  ),
                  BottomBarItem(
                    icon: FontAwesomeIcons.plus,
                    onTap: () {},
                  ),
                  BottomBarItem(
                    icon: FontAwesomeIcons.heart,
                    isSelected: pageIndex == 1,
                    onTap: () {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOutCubic);
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                  ),
                  BottomBarItem(
                    icon: FontAwesomeIcons.user,
                    isSelected: pageIndex == 2,
                    onTap: () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOutCubic);
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [HomeView(), ActivityView(), ProfileView()],
      ),
    );
  }
}
