import 'package:flutter/material.dart';
import 'package:islami/appColors.dart';

class Radiotab extends StatefulWidget {
  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> {
  int selectedIndix = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/PNG_Images/Logo.png'),
            TabBar(
                onTap: (index) {
                  selectedIndix = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.all(0),
                tabs: [
                  tapUi(
                    isSelected: selectedIndix == 0 ? true : false,
                    tabname: "Radio",
                  ),
                  tapUi(
                    isSelected: selectedIndix == 1 ? true : false,
                    tabname: "Reciters",
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return radioContanerUi();
                  },
                  itemCount: 2,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: size.height * 0.02,
                    );
                  },
                ),
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return radioContanerUi();
                  },
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: size.height * 0.02,
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class tapUi extends StatelessWidget {
  bool isSelected;
  String tabname;
  tapUi({required this.isSelected, required this.tabname});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: size.width,
      decoration: BoxDecoration(
          color: isSelected ? Appcolors.primaryDark : Appcolors.blackOBColor,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          tabname,
          style: TextStyle(
              fontSize: 16,
              color: isSelected ? Appcolors.blackColor : Colors.white),
        ),
      ),
    );
  }
}

class radioContanerUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.02),
      decoration: BoxDecoration(
          color: Appcolors.primaryDark,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            "Radio Ibrahim Al-Akdar",
            style: TextStyle(
              color: const Color.fromRGBO(32, 32, 32, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/PNG_Images/Mosque-02.png',
              
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 44),
                  Icon(Icons.play_arrow, size: 44),
                  Icon(Icons.volume_up, size: 44),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
