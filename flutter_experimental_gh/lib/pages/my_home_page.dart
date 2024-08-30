import 'package:flutter/material.dart';

import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Column(
        children: [
          Text('Base Url: ${F.baseUrl}'),
          Center(
            child: Text(
              'Hello ${F.title}',
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(F.imageUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
