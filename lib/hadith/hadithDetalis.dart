import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';
import 'package:islami/model/hadithModel.dart';

class Hadithdetalis extends StatelessWidget {
  static String HadithdetalisRoute = "hadithdetalisroute";
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Hadithmodel;
    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      appBar: AppBar(),
      body: Stack(
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
          Container(
              margin: EdgeInsets.all(20),
              child:

                  //  Column(

                  //   children: [
                  //     Text(
                  //       args.title,
                  //       style: TextStyle(
                  //           color: Appcolors.primaryDark,
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //     ),
                  //     Text(args.content,
                      // style: TextStyle(
                      //       color: Appcolors.primaryDark,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                  //     )
                  //   ],
                  //  ),
                  Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "${args.title}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Appcolors.primaryDark),
                    ),
                  ),
                  Container(
                    height: 620,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Text(args.content,
                              style: TextStyle(
                            color: Appcolors.primaryDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      itemCount: 1,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
