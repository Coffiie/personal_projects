import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class CupertinoButtons extends StatelessWidget {
  const CupertinoButtons({super.key});

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
                    'Cupertino Tinted Button',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoButton.tinted(
                    onPressed: () {},
                    onLongPress: () {},
                    sizeStyle: CupertinoButtonSize.small,
                    child: Text('Small'),
                  ),
                  CupertinoButton.tinted(
                    onPressed: () {},
                    sizeStyle: CupertinoButtonSize.medium,
                    child: Text('Medium'),
                  ),
                  CupertinoButton.tinted(
                    onPressed: () {},
                    sizeStyle: CupertinoButtonSize.large,
                    child: Text('Large'),
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
