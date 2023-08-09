import 'package:flutter/material.dart';

class DataModel {
  final String title;
  final String description;

  DataModel({
    required this.title,
    required this.description,
  });
}

final colors = Colors.accents.toList();
final todoList = [
  DataModel(title: 'Brainstorming session', description: '10:00 AM - 12:00 PM'),
  DataModel(title: 'Code Reviews', description: '12:00 PM - 1:30 PM'),
  DataModel(title: 'Lunch break', description: '1:30 PM - 2:30 PM'),
  DataModel(title: 'Wired in', description: '2:30 PM - 5:00 PM'),
  DataModel(title: 'Gym', description: '5:00 PM - 6:00 PM'),
  DataModel(title: 'Nap', description: '6:00 PM - 8:00 PM'),
  DataModel(title: 'Nap turns to sleep', description: '8:00 PM - 7:00 AM'),
];
