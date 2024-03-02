import 'package:flutter/material.dart';

Widget detailsCard({String? count, String? title}) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      width: 110,
      height: 80,
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 20)),
          Text(title!, style: TextStyle(color: Colors.deepOrange)),
        ],
      ));
}
