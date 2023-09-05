import 'dart:math';

import 'package:flutter/material.dart';

class DiceeRoller extends StatefulWidget {
  const DiceeRoller({super.key});

  @override
  State<DiceeRoller> createState() => _DiceeRollerState();
}

class _DiceeRollerState extends State<DiceeRoller> {
  int _index = 1;

  void _rollDice() {
    setState(() {
      _index = _generateIndex();
    });
  }

  int _generateIndex() => Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$_index.png'),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _rollDice,
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          child: const Text('Roll'),
        ),
      ],
    );
  }
}
