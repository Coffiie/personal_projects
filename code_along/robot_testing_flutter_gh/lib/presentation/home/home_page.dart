import 'package:flutter/material.dart';
import 'package:robot_testing_flutter_gh/presentation/core/widget_keys.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      key: WidgetKeys.homeScreen,
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
