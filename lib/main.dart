import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/hadith/hadithDetalis.dart';
import 'package:islami/home.dart';
import 'package:islami/introductionScreen.dart';
import 'package:islami/mythemdata.dart';
import 'package:islami/quan/suraDitailes.dart';

   
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return
     MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // initialRoute: home
      home: IntroductionScreenExample(),
      routes: {
        // Introductionscreen.IntroductionscreenRoute :(context) =>IntroductionScreen(),
        Home.homeRoute :(context) =>Home() ,
        Suraditailes.suraditailesRoute :(context) => Suraditailes(),
        Hadithdetalis.HadithdetalisRoute :(context)=> Hadithdetalis()

      },
      theme: Mythemdata.themeData ,
      
     )
    ;
  }
}
