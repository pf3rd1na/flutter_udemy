import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormatter = DateFormat('dd/MM/yyyy');

enum Category {
  food,
  travel,
  accommodations,
  entertainment,
  other,
}

const Map<Category, IconData> categoryIcon = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.card_travel,
  Category.accommodations: Icons.house,
  Category.entertainment: Icons.tv,
  Category.other: Icons.gamepad,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
