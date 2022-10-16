import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/data/data.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';
import 'package:instagram_redesign_sc_app/views/common/curved_button.dart';
import 'package:instagram_redesign_sc_app/views/profile/gallery_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
        title: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'manualroveradesign',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.profileNameColorLight),
              ),
              SizedBox(
                width: 8,
              ),
              FaIcon(
                FontAwesomeIcons.chevronDown,
                color: AppColors.profileNameColorLight,
                size: 12,
              )
            ],
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
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '23.7K',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text('Followers')
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              const CurvedButton(
                isAdd: false,
                imagePath: 'assets/b.jpg',
                name: '',
                isProfileImage: true,
                hasText: false,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '488',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text('Following')
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Manuel Rovira',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 4,
                ),
                VerticalDivider(
                  thickness: 1.5,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Photographer',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Like to travel and shoot cinematic and b/w photos.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.profileNameColorLight),
          ),
          const Text(
            'Tools - Capture One for Raw. @photolove21',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.profileNameColorLight),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Statistics',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.profileContactButtonLight),
                    child: const Text(
                      'Contact',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: h * 0.1,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: imagePaths.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CurvedButton(
                    hasInstaBorders: false,
                    addText: 'New',
                    isAdd: index == 0,
                    imagePath: index == 0 ? '' : highlightImages[index - 1],
                    name: index == 0 ? '' : highlights[index - 1])),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ),
          const GalleryWidget()
        ],
      ),
    );
  }
}
