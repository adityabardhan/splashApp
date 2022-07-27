import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import 'package:splash/pages/facts.dart';
import 'package:splash/pages/geo.dart';
import 'package:splash/pages/gov.dart';
import 'package:splash/pages/industry.dart';
import 'package:splash/pages/lang.dart';
import 'package:splash/pages/popl.dart';
import 'package:splash/pages/weather.dart';
import 'package:splash/screens/dark_profile.dart';
import 'package:splash/screens/drawer.dart';
import '../pages/cm.dart';
import 'PagesGlobalCM/interm.dart';

class HomePage extends StatefulWidget {
  String mail, state;
  HomePage({Key? key, required this.mail, required this.state})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return FadeIn(
      0.6,
      WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: const Color(0xF2C0CFDB),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              "HOME",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(mail: widget.mail))),
                  child: const Icon(Icons.account_circle_rounded,shadows: [
                    Shadow(
                      color: Colors.black45
                    )
                  ],size: 26,),
                ),
              ),
            ],
          ),
          drawer: MainDrawer(mail: widget.mail),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              "assest/images/home_Image/skyline.jpeg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Details').doc('SNeTrknGJjrQWPvFD3QW').snapshots(),
                      builder: (context,snapshot){
                        if (!snapshot.hasData) {
                          return  const Text("Loading");
                        }
                        else {
                            var userDocument = snapshot.data;
                            return Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Available Information is available for ${"West Benngal"}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        },
                    )
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(9.0),
                        shrinkWrap: true,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Intermediate()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/chief.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Governer()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/gov.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Geography()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/gps.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Languages()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/language.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Population()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/populate.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Weather()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/forecast.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Facts()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/facts.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Industry()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assest/images/home_Image/industry.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            title: Text(
              'Are you sure?',
              style: GoogleFonts.lato(
                fontSize: 20,
              ),
            ),
            content: Text(
              'Do you want to exit the App',
              style: GoogleFonts.lato(
                fontSize: 17,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.lato(
                    fontSize: 17,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.lato(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;
  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: 0.0, end: 1.0), const Duration(milliseconds: 500))
      ..add("translateY", Tween(begin: 130.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<String>>(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      curve: Curves.decelerate, // or fastOutSlowIn
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
            offset: Offset(0, value.get("translateY")), child: child),
      ),
    );
  }
}
