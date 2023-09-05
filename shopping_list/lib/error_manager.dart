import 'package:flutter/material.dart';

const kLogError = true;

class ErrorManager {
  static void showError(dynamic error) {
    if (kLogError) {
      print(error);
    }
  }

  static void showErrorSnackBar(dynamic error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.toString()),
      ),
    );
    showError(error);
  }
}
