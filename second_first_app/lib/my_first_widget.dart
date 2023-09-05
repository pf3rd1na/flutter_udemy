import 'package:flutter/material.dart';
import 'package:second_first_app/dicee_roller.dart';
import 'package:second_first_app/styled_text.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget(
    this.colors, {
    super.key,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: const Center(
        // child: StyledText('Hello, world!'),
        child: DiceeRoller(),
      ),
    );
  }
}
