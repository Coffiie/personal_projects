import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class CupertinoAlertDialogExample extends StatelessWidget {
  const CupertinoAlertDialogExample({super.key});

  void _showAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with upgrade?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

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
                    'Cupertino Alert Dialog',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoButton.tinted(
                    onPressed: () => _showAlertDialog(context),
                    sizeStyle: CupertinoButtonSize.large,
                    child: Text('Show Dialog'),
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
