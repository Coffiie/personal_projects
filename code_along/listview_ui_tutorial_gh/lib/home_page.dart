import 'package:flutter/material.dart';
import 'package:listview_ui_tutorial_gh/mock_data.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to - Listview'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tileColor: colors[Random().nextInt(todoList.length)],
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  todoList[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              subtitle: Text(
                todoList[index].description,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
