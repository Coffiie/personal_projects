import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

enum Sky { disabled, success, warning }

Map<Sky, Color> colors = <Sky, Color>{
  Sky.disabled: CupertinoColors.destructiveRed,
  Sky.success: CupertinoColors.activeGreen,
  Sky.warning: CupertinoColors.activeOrange,
};

class CupertinoSlidingSegmentedControlExample extends StatefulWidget {
  const CupertinoSlidingSegmentedControlExample({
    super.key,
  });

  @override
  State<CupertinoSlidingSegmentedControlExample> createState() =>
      _CupertinoSlidingSegmentedControlExampleState();
}

class _CupertinoSlidingSegmentedControlExampleState
    extends State<CupertinoSlidingSegmentedControlExample> {
  Sky _selectedSegment = Sky.disabled;

  final _children = const <Sky, Widget>{
    Sky.disabled: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Disabled',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
    Sky.success: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Success Final',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
    Sky.warning: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Warning',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
  };

  final _proportionalChildren = const <Sky, Widget>{
    Sky.disabled: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Disabled',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
    Sky.success: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Success Finally!!',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
    Sky.warning: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Warning',
        style: TextStyle(color: CupertinoColors.white),
      ),
    ),
  };

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
                    'Cupertino Sliding\nSegmented Control',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoSlidingSegmentedControl<Sky>(
                    backgroundColor: CupertinoColors.systemGrey2,
                    thumbColor:
                        colors[_selectedSegment] ?? CupertinoColors.activeBlue,
                    children: _children,
                    groupValue: _selectedSegment,
                    onValueChanged: (Sky? value) {
                      if (value != null) {
                        setState(() {
                          _selectedSegment = value;
                        });
                      }
                    },
                  ),
                  Text(
                    'Disabled first child and proportional width',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoSlidingSegmentedControl<Sky>(
                    backgroundColor: CupertinoColors.systemGrey2,
                    proportionalWidth: true,
                    disabledChildren: {Sky.disabled},
                    thumbColor:
                        colors[_selectedSegment] ?? CupertinoColors.activeBlue,
                    children: _proportionalChildren,
                    groupValue: _selectedSegment,
                    onValueChanged: (Sky? value) {
                      if (value != null) {
                        setState(() {
                          _selectedSegment = value;
                        });
                      }
                    },
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
