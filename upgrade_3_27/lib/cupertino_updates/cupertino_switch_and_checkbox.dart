import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_3_27/app_bar.dart';

class CupertinoSwitchAndCheckbox extends StatelessWidget {
  const CupertinoSwitchAndCheckbox({
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
                    'Cupertino Widgets',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (val) {},
                    // trackColor: Colors.red,
                    inactiveTrackColor: Colors.red,
                  ),
                  Transform.scale(
                    scale: 3,
                    child: CupertinoCheckbox(
                      value: true,
                      onChanged: (val) {},
                      // inactiveColor: Colors.red,
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return CupertinoColors.systemBlue;
                        }
                        return Colors.red;
                      }),
                    ),
                  ),
                  Transform.scale(
                      scale: 3,
                      child: CupertinoRadio(
                          value: true, groupValue: true, onChanged: (val) {})),
                ],
              ),
            ],
          ),
          Column(
            spacing: 20,
            children: [
              Text(
                'Material Widgets',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Switch(value: true, onChanged: (val) {}),
              Transform.scale(
                scale: 3,
                child: Checkbox(value: true, onChanged: (val) {}),
              ),
              Transform.scale(
                  scale: 3,
                  child: Radio(
                      value: true, groupValue: true, onChanged: (val) {})),
            ],
          ),
        ],
      ),
    );
  }
}
