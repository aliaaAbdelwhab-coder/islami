import 'package:flutter/material.dart';

class Timetab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return
     Stack(
      children: [ 
        Image.asset("assets/images/PNG_Images/Time_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(),
      ],
     )
     
    ;
  }

}