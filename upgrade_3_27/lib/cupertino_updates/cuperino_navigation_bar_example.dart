import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarExample extends StatelessWidget {
  const CupertinoNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey.withAlpha(50),
        middle: Text(
          'Flutter 3.27',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight * 2,
            ),
            Center(
              child: Text(
                'Cupertino Navigation Bar',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
