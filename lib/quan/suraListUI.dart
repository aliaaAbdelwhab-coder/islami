import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';
import 'package:islami/model/suraModel.dart';


class Suralistui extends StatelessWidget {
  Suramodel suramodel;
  Suralistui(
      {required this.suramodel});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/PNG_Images/IconVerses.png"),
            Text(
              "${suramodel.suraIndex+1}",
              style: TextStyle(
                color: Appcolors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              suramodel.suraEnglishName,
              style: TextStyle(
                color: Appcolors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${suramodel.numOfVerses} Verses",
              style: TextStyle(
                color: Appcolors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            suramodel.suraArabicName,
            style: TextStyle(
              color: Appcolors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
