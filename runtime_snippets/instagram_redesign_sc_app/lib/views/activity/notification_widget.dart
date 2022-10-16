import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_redesign_sc_app/data/notification_data.dart';
import 'package:instagram_redesign_sc_app/theme/app_colors.dart';
import 'package:instagram_redesign_sc_app/utils/utils.dart';
import 'package:instagram_redesign_sc_app/views/common/curved_button.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notificationData});
  final NotificationData notificationData;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Utils().isDark(context)
                ? Colors.grey.withOpacity(0.3)
                : Theme.of(context).scaffoldBackgroundColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 57,
              width: 57,
              child: CurvedButton(
                hasInstaBorders: notificationData.hasStory,
                isAdd: false,
                imagePath: notificationData.profilePhoto,
                name: '',
                hasText: false,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                notificationData.isFollow
                    ? const SizedBox(
                        height: 8,
                      )
                    : const SizedBox.shrink(),
                Text(
                  notificationData.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Flexible(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: notificationData.subText,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Utils().isDark(context)
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.black.withOpacity(0.4))),
                        TextSpan(
                            text: '  ${notificationData.date}',
                            style: TextStyle(
                                fontSize: 12,
                                color: Utils().isDark(context)
                                    ? Colors.white.withOpacity(0.7)
                                    : Colors.black.withOpacity(0.4)))
                      ])),
                    )
                  ],
                ),
                notificationData.isFollow
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 8,
                      ),
                notificationData.isFollow
                    ? const SizedBox.shrink()
                    : Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          FaIcon(
                            FontAwesomeIcons.commentDots,
                            size: 20,
                          )
                        ],
                      ),
              ],
            )),
            notificationData.isFollow
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(50, 50),
                        backgroundColor: AppColors.profileContactButtonLight),
                    onPressed: () {},
                    child: const Text(
                      'Follow back',
                      style: TextStyle(color: Colors.white),
                    ))
                : Container(
                    width: w * 0.18,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(notificationData.commentImage))),
                  )
          ],
        ),
      ),
    );
  }
}
