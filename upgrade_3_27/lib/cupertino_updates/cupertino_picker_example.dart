import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  State<CupertinoPickerExample> createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  int _selectedFruit = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Cupertino Picker',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  CupertinoButton.tinted(
                    onPressed: () => _showDialog(
                      CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: _kItemExtent,
                        scrollController: FixedExtentScrollController(
                          initialItem: _selectedFruit,
                        ),
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedFruit = selectedItem;
                          });
                        },
                        children: List<Widget>.generate(_fruitNames.length,
                            (int index) {
                          return Center(
                              child: Text(
                            _fruitNames[index],
                            style: Theme.of(context).textTheme.titleLarge,
                          ));
                        }),
                      ),
                    ),
                    child: Text(
                      _fruitNames[_selectedFruit],
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
