import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor_app_material_you_speed_code/chip_widget.dart';
import 'package:photo_editor_app_material_you_speed_code/edit_photo_view.dart';
import 'package:photo_editor_app_material_you_speed_code/grid_child.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 50,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/p_3.jpg'))),
            ),
          )
        ],
        title: Text(
          'Hello Fitri',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 400),
        middleColor: Theme.of(context).scaffoldBackgroundColor,
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.transparent,
        closedElevation: 5,
        openBuilder: (context, _) => const EditPhotoView(),
        closedBuilder: (context, openContainer) =>
            FloatingActionButton.extended(
          onPressed: () {
            openContainer();
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Take a photo'),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.globe), label: ''),
          NavigationDestination(icon: Icon(CupertinoIcons.search), label: ''),
          NavigationDestination(
              icon: Icon(CupertinoIcons.settings_solid), label: '')
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).backgroundColor,
          ),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'My Albums',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    ChipWidget(
                      label: Text(
                        'See All',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 25,
                  children: const [
                    GridChild(
                      count: 132,
                      description: 'Vacation',
                      imagePath: 'assets/a_1.jpg',
                    ),
                    GridChild(
                      count: 42,
                      description: 'Building',
                      imagePath: 'assets/a_2.jpg',
                    ),
                    GridChild(
                      count: 72,
                      description: 'Vacation',
                      imagePath: 'assets/a_3.jpg',
                    ),
                    GridChild(
                      count: 21,
                      description: 'Geometric',
                      imagePath: 'assets/a_4.jpg',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'People',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    ChipWidget(
                        label: Text(
                      'See All',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/p_${index + 1}.jpg'))),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}
