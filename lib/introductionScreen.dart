import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/appColors.dart';
import 'package:islami/home.dart';

class IntroductionScreenExample extends StatelessWidget {
  // static const String IntroductionscreenRoute = "Introductionscreen";

  PageViewModel getPages(double height, String text, String image,
      {String footerText = ''}) {
    return PageViewModel(
      titleWidget: Image.asset('assets/images/PNG_Images/Logo.png'),
      bodyWidget: Container(
        // color: Colors.amber,
        height: height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/PNG_Images/$image'),
            Text(
              text,
              style: TextStyle(
                color: Appcolors.primaryDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              footerText,
              style: TextStyle(
                color: Appcolors.primaryDark,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IntroductionScreen(
        bodyPadding: EdgeInsets.all(0),
        controlsPadding: EdgeInsets.all(0),
        pages: [
          getPages(size.height, "Welcome To Islmi App", "intro1.png"),
          getPages(size.height, "Welcome To Islmi App", "intro2.png",
              footerText: "We Are Very Excited To Have You In Our Community"),
          getPages(size.height, "Reading the Quran", "intro3.png",
              footerText: "Read, and your Lord is the Most Generous"),
          getPages(size.height, "Bearish", "intro4.png",
              footerText: "Praise the name of your Lord, the Most High"),
          getPages(size.height, "Holy Quran Radio", "intro5.png",
              footerText:
                  "You can listen to the Holy Quran Radio through the application for free and easily"),
        ],
        onDone: () {
          Navigator.of(context).pushReplacementNamed(Home.homeRoute);
        },
        done: const Text(
          "Finsh",
          style: TextStyle(color: Appcolors.primaryDark),
        ),
        next: const Text(
          "Next",
          style: TextStyle(color: Appcolors.primaryDark),
        ),
        back: const Text(
          "Back",
          style: TextStyle(color: Appcolors.primaryDark),
        ),
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        curve: Curves.fastLinearToSlowEaseIn,
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          activeColor: Appcolors.primaryDark,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
