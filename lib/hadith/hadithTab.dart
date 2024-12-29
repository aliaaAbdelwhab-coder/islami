import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/appColors.dart';
import 'package:islami/hadith/hadithDetalis.dart';
import 'package:islami/model/hadithModel.dart';

class Hadithtab extends StatefulWidget {
  @override
  State<Hadithtab> createState() => _HadithtabState();
}

class _HadithtabState extends State<Hadithtab> {
  List<Hadithmodel> hadithData = [];

  @override
  Widget build(BuildContext context) {
    if (hadithData.isEmpty) {
      loadHadith();
    }
    return Stack(
      children: [
        Image.asset(
          "assets/images/PNG_Images/hadith_bg.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: hadithData.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/PNG_Images/Logo.png"),
                    // Text(hadithData[0].title),
                    CarouselSlider.builder(
                      itemCount: hadithData.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          InkWell(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.topCenter,
                          width: 313,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/PNG_Images/HadithSliderBackground.png",
                                ),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15),
                            color: Appcolors.primaryDark,
                          ),
                          child: Column(
                            children: [
                              Text(
                                hadithData[itemIndex].title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  hadithData[itemIndex].content,
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Hadithdetalis.HadithdetalisRoute,
                              arguments: hadithData[itemIndex]
                              
                              );
                        },
                      ),
                      options:
                          CarouselOptions(height: 545, enlargeCenterPage: true),
                    )
                  ],
                ),
        ),
      ],
    );
  }

  void loadHadith() async {
    for (var i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString("assets/Files/Hadeeth/h$i.txt");
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join();
      Hadithmodel hadithmodel = Hadithmodel(title: title, content: content);
      hadithData.add(hadithmodel);
    }
    setState(() {});
  }
}
