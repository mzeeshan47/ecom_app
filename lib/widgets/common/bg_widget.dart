import 'package:flutter/material.dart';

Widget bgWidget(Widget? child) {
  return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/icons/Background.jpg'), fit: BoxFit.fill, opacity: 0.9)
      ),
    child: child,
  );
}


