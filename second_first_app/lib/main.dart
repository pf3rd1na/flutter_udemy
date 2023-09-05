import 'package:flutter/material.dart';
import 'package:second_first_app/my_first_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: MyFirstWidget(
          [
            Colors.blue,
            Colors.green,
            Colors.red,
          ],
        ),
      ),
    ),
  );
}
