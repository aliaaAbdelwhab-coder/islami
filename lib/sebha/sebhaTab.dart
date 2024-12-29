import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';

class Sebhatab extends StatefulWidget {
  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  double turns = 0;
  int num = 0;
  int index = 0;
  List<String> dhikrList = [
    "سُبْحَانَ اللَّهِ",
    "الحمد لله",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "أستغفر الله ",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/PNG_Images/Logo.png"),
        const Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Appcolors.whiteColor,
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        Container(
          child: InkWell(
            onTap: () => setState(() {
              turns += 1 / 33;
              if (num < 33) {
                num++;
              } else {
                turns = 0;
                num = 0;
                if (index < 5) {
                  index++;
                } else {
                  index = 0;
                }
              }
            }),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(microseconds: 1),
                  child: Image.asset(
                    "assets/images/PNG_Images/Sebha.png",
                  ),
                ),
                Column(
                  children: [
                    Text(
                      dhikrList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Appcolors.whiteColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$num",
                      style: TextStyle(
                          color: Appcolors.whiteColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
