import 'package:flutter/material.dart';
import 'package:instagram_redesign_sc_app/data/data.dart';
import 'package:instagram_redesign_sc_app/data/notification_data.dart';
import 'package:instagram_redesign_sc_app/views/activity/activity_button.dart';
import 'package:instagram_redesign_sc_app/views/activity/notification_widget.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Activity',
          style: TextStyle(
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedIconTheme!
                  .color),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 8, right: 16),
                itemCount: buttonData.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ActivityButton(
                      amount: i == 1 || i == 2 ? 34 : 0,
                      buttonText: buttonData[i],
                      isSelected: i == selectedIndex,
                      onPressed: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'New (54)',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: notificationData.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: NotificationWidget(
                    notificationData: notificationData[index],
                  ),
                );
              })
        ],
      ),
    );
  }
}
