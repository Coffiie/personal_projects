import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/data/data.dart';
import 'package:instagram_redesign_sc_app/providers/app_provider.dart';
import 'package:instagram_redesign_sc_app/views/common/curved_button.dart';
import 'package:instagram_redesign_sc_app/views/home/post_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.gear),
            onPressed: () {},
          ),
        ),
        title: GestureDetector(
          onTap: () {
            context.read<AppProvider>().changeTheme();
          },
          child: FaIcon(
            FontAwesomeIcons.instagram,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme!
                .color,
            size: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.envelope),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: h * 0.1,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) => CurvedButton(
                        name: index == 0 ? '' : names[index - 1],
                        isAdd: index == 0,
                        imagePath: index == 0 ? '' : imagePaths[index - 1],
                      )),
            ),
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) => Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.8,
                      widthFactor: 1,
                      child: PostItem(
                        isMultiple: index == 0,
                        profileImagePath: imagePaths[index],
                        profileName: names[index],
                        backgroundImagePaths: index == 0
                            ? multipleImagePostData
                            : List.from([backgroundImagePaths[index]]),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
