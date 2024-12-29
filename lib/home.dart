import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';
import 'package:islami/hadith/hadithTab.dart';
import 'package:islami/quan/quanTab.dart';
import 'package:islami/radio/radioTab.dart';
import 'package:islami/sebha/sebhaTab.dart';
import 'package:islami/time/timeTab.dart';


class Home extends StatefulWidget {
  static String homeRoute = "homeRout";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndix = 0;
  List<String> backgroundImages = [
    "assets/images/PNG_Images/quran_bg.jpg",
    "assets/images/PNG_Images/hadith_bg.jpg",
    "assets/images/PNG_Images/Sapha_bg.png",
    "assets/images/PNG_Images/radio_bg.jpg",
    "assets/images/PNG_Images/Time_bg.png",
  ];
  List<Widget> tabsUIList = [
    Quantab(),
    Hadithtab(),
    Sebhatab(),
    Radiotab(),
    Timetab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndix],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndix,
            onTap: (index) {
              selectedIndix = index;
              
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: bottomNavigationUi(0, "quran"), label: 'Quran'),
              BottomNavigationBarItem(
                  icon: bottomNavigationUi(1, "hadith"), label: 'Hadith'),
              BottomNavigationBarItem(
                  icon: bottomNavigationUi(2, "sepha"), label: 'Sepha'),
              BottomNavigationBarItem(
                  icon: bottomNavigationUi(3, "radio"), label: 'Radio'),
              BottomNavigationBarItem(
                  icon: bottomNavigationUi(4, "time"), label: 'Time'),
            ],
          ),
          body: tabsUIList[selectedIndix],
        ),
      ],
    );
  }

  Widget bottomNavigationUi(int index, String imageName) {
    return selectedIndix == index
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Appcolors.blackOBColor),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            child: ImageIcon(
                AssetImage("assets/images/PNG_Images/$imageName.png")),
          )
        : ImageIcon(AssetImage("assets/images/PNG_Images/$imageName.png"));
  }
}
