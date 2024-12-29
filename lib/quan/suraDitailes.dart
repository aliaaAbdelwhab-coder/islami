import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islami/appColors.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/quan/AyaUI.dart';


class Suraditailes extends StatefulWidget {
  static String suraditailesRoute = "suraditailesRoute";

  @override
  State<Suraditailes> createState() => _SuraditailesState();
}

class _SuraditailesState extends State<Suraditailes> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Suramodel args = ModalRoute.of(context)?.settings.arguments as Suramodel;
    if (verses.isEmpty){
         loudSuraFile(args.suraIndex);
    }
    
    return Scaffold(
      appBar: AppBar(title: Text("${args.suraEnglishName}")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Appcolors.blackColor,
            child: Image.asset(
              "assets/images/PNG_Images/backgroundSuraDitailes.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "${args.suraArabicName}",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.primaryDark),
                ),
              ),
              Container(
                height: 620,
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.primaryDark,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                        return  Ayaui(content: "${verses[index]}",
                          index: index,
                         );
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void loudSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString("assets/Files/Suras/${index + 1}.txt");
    List<String> suraLins = suraContent.split('\n');
    verses = suraLins;
    setState(() {});
  }
}
