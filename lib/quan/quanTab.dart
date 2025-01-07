import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';
import 'package:islami/introductionScreen.dart';
import 'package:islami/model/suraModel.dart';
import 'package:islami/quan/suraDitailes.dart';
import 'package:islami/quan/suraListUI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quantab extends StatefulWidget {
  @override
  State<Quantab> createState() => _QuantabState();
}

class _QuantabState extends State<Quantab> {
  void addSuradata() {
    for (var i = 0; i < 114; i++) {
      Suramodel.suraData.add(Suramodel(
          suraArabicName: Suramodel.arabicAuranSuras[i],
          suraEnglishName: Suramodel.englishQuranSurahs[i],
          numOfVerses: Suramodel.AyaNumber[i],
          suraIndex: i));
    }
  }

  String textSearch = '';
  List<Suramodel> filterList = Suramodel.suraData;
  int savedIndex = 0;

  @override
  void initState() {
    // Introductionscreen();
    addSuradata();
    loadSavedSura();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset("assets/images/PNG_Images/Logo.png")),
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              textSearch = text;
              filterList = Suramodel.suraData.where((suramodel) {
                return suramodel.suraArabicName.contains(text) ||
                    suramodel.suraEnglishName
                        .toLowerCase()
                        .contains(text.toLowerCase());
              }).toList();

              setState(() {});
            },
            cursorColor: Appcolors.whiteColor,
            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: TextStyle(color: Appcolors.whiteColor),
              prefixIcon: ImageIcon(
                AssetImage("assets/images/PNG_Images/quran.png"),
                color: Appcolors.primaryDark,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Appcolors.primaryDark)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Appcolors.primaryDark)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          textSearch.isNotEmpty ? SizedBox() : buildMostResently(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Suras List",
            style: TextStyle(
              color: Appcolors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.separated(
                // padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      SaveLastSura(filterList[index].suraIndex);
                      //Future.delayed(Duration(seconds: 2), () {
                      //  loadSavedSura();
                      // });
                      Navigator.of(context).pushNamed(
                          Suraditailes.suraditailesRoute,
                          arguments: filterList[index]);
                    },
                    child: Container(
                      child: filterList.isEmpty
                          ? SizedBox()
                          : Suralistui(
                              suramodel: filterList[index],
                            ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                    indent: 64,
                    endIndent: 64,
                  );
                },
                itemCount: filterList.isEmpty ? 1 : filterList.length),
          )
        ],
      ),
    );
  }

  Widget buildMostResently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently ",
          style: TextStyle(
            color: Appcolors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Appcolors.primaryDark,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("${filterList[savedIndex].suraEnglishName}"),
                  Text("${filterList[savedIndex].suraArabicName}"),
                  Text("${filterList[savedIndex].numOfVerses}"),
                ],
              ),
              Image.asset("assets/images/PNG_Images/mostResently.png"),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> SaveLastSura(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("Index", index);
    await loadSavedSura();
  }

  Future<int> gitSuraSaved() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int savedIndex = prefs.getInt("Index") ?? 0;
    // loadSavedSura();
    return savedIndex;
  }

  loadSavedSura() async {
    savedIndex = await gitSuraSaved();
    setState(() {});
  }
}
