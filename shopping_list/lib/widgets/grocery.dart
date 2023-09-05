import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class Grocery extends StatelessWidget {
  const Grocery({
    super.key,
    required this.grocery,
  });

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.square, color: grocery.category.color),
          const SizedBox(width: 16),
          Text(grocery.name),
          const Spacer(),
          Text('${grocery.quantity}'),
        ],
      ),
    );
  }
}
