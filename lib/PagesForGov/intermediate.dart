import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:splash/PagesForGov/president.dart';
import 'package:splash/PagesGlobalCM/help.dart';
import 'package:splash/PagesGlobalCM/pm.dart';
import 'package:splash/PagesGlobalCM/search.dart';
import 'package:splash/pages/cm.dart';
import 'package:splash/pages/gov.dart';

import 'help.dart';

class SecIntermediate extends StatefulWidget {
  const SecIntermediate({Key? key}) : super(key: key);

  @override
  State<SecIntermediate> createState() => _SecIntermediateState();
}

class _SecIntermediateState extends State<SecIntermediate> {

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  late final List<Widget> _items = [const Governor(),const President(),const HelpScreen()];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blueGrey.shade300,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   title: const Text("CM Catalogue"),
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(MdiIcons.numeric1Circle,size: 30),
          Icon(MdiIcons.numeric2Circle, size: 30),
          Icon(MdiIcons.helpCircle, size: 30),
        ],
        animationDuration:  const Duration(milliseconds: 600),
        animationCurve: Curves.decelerate,
        color: Colors.greenAccent.shade400.withOpacity(0.25),
        buttonBackgroundColor: Colors.white60,
        backgroundColor: Colors.greenAccent.shade100,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body:Center(
          child: IndexedStack(
            index: page,
            children: _items,
          )//
      ),
    );
  }
}