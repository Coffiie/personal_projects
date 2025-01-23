import 'package:flutter/material.dart';
import 'package:upgrade_3_27/general_updates/row_column_spacing_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const FlutterUpgrade(title: 'Flutter 3.27'),
    );
  }
}

class FlutterUpgrade extends StatelessWidget {
  const FlutterUpgrade({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return RowColumnSpacingExample();
  }
}
