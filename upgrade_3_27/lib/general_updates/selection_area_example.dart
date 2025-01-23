import 'package:flutter/material.dart';

class SelectionAreaExample extends StatelessWidget {
  SelectionAreaExample({super.key});
  final selectableRegionState = GlobalKey<SelectionAreaState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: GestureDetector(
          onTap: () {
            selectableRegionState.currentState?.selectableRegion
                .clearSelection();
          },
          child: Text(
            'Flutter 3.27',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
      body: SelectionArea(
        key: selectableRegionState,
        child: Column(
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
                      'Selection Area',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Selection 1',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Selection 2',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Selection 3',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
