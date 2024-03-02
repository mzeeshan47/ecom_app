import 'package:flutter/material.dart';


Widget homeButtons(width, height, icon, title, onPress){
return Container(
  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
children:[
  Image.asset(icon, width: 45, alignment: Alignment.center,),
  SizedBox(height: 10,),
  Text(title, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),)
],
  ),);

}


