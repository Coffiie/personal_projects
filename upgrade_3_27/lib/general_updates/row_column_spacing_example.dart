import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class RowColumnSpacingExample extends StatelessWidget {
  const RowColumnSpacingExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAppBar(),
      body: Column(
        spacing: 50,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Widget 1',
                  ),
                  Text(
                    'Widget 2',
                  ),
                  Text(
                    'Widget 3',
                  ),
                  Text(
                    'Widget 4',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
