import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';

class Mythemdata {
static final ThemeData themeData = ThemeData(
     appBarTheme: const AppBarTheme(
        backgroundColor: Appcolors.blackColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20 ,
          fontWeight: FontWeight.bold,
          color:Appcolors.primaryDark,
          
        ),
        iconTheme: IconThemeData(
          color: Appcolors.primaryDark,
        )
     ),
  //  scaffoldBackgroundColor: const Color.fromRGBO(48, 48, 48, 0.541),
  scaffoldBackgroundColor: const Color.fromARGB(174, 32, 32, 32),
    bottomNavigationBarTheme :const BottomNavigationBarThemeData(
            showUnselectedLabels: false,
              backgroundColor: Appcolors.primaryDark,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,      
              unselectedItemColor: Appcolors.blackColor,
              
               showSelectedLabels: true,
               
    )
);
}
