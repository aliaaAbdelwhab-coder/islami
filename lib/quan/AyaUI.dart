import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';

class Ayaui extends StatelessWidget {
  String content;
  int index ;
  Ayaui({required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5 ),
      margin: EdgeInsets.symmetric(vertical: 8 ,horizontal: 22),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Appcolors.primaryDark),
      ),
      child: Text(
        "$content [${index+1}]",
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: Appcolors.primaryDark,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
