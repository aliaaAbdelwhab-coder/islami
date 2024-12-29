import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';

class Radiotab extends StatefulWidget {
  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return 
    Stack(
      children: [
        Image.asset(
          "assets/images/PNG_Images/radio_bg.jpg",
          color: Color.fromARGB(56, 32, 32, 32),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       // Image.asset("assets/images/PNG_Images/Logo.png"),
        //       TabBar(
        //         controller: _tabController,
        //         tabs: [
          
        //         Tab(
        //           text: "data",
        //         ),
        //         Tab(
        //           text: "data",
        //         ),
        //       ]),
        //       TabBarView(
        //         controller: _tabController,
        //         children: [
                
        //         Text("hi data3"),
        //       Text("hi data2")
          
        //       ]),
        //     ],
        //   ),
        // ),
        Container(
          width: double.infinity,
          height: 300 ,
          child: TabBar(
            controller: _tabController,
            tabs: [Text("data"),
                Text("data2")
               ]
          
          ),
        ),
        TabBarView(
          controller: _tabController,
          children:[
            Text("1",
            style: TextStyle(
              color: Appcolors.whiteColor,
              fontSize: 36,
              fontWeight: FontWeight.bold),
            ),
            Text('2',
            
            ),
          ]
           )
      ],
    );
  }
}
