// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.color,
    required this.onPress,
    required this.textColor,
    required this.title,
  });

  final VoidCallback onPress;
  final color;
  final textColor;
  final title;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(),
            fixedSize: Size(screenWidth * 0.9, screenHeight * 0.040)),
        onPressed: onPress,
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor)));
  }
}
