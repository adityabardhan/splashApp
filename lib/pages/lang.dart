import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Animation/FadeAnimation.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: FadeAnimation(
        1.5, SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeAnimation(1.0, Padding(
                  padding: EdgeInsets.only(top: 40,left: 80,right: 80),
                  child: Text("Languages Spoken in West Bengal",style: GoogleFonts.assistant(fontSize: 21,fontWeight: FontWeight.bold),textAlign:
                    TextAlign.center,))),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 30,bottom: 30),
                child: Image.asset('assest/images/home_Image/WbEmb.png',height: 250,filterQuality: FilterQuality.high,),
              ),
              FadeAnimation(1.8,
                Text("Bengali Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(1.9,
                Text("Bhumij Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.0,
                Text("Hindi ",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.1,
                Text("Khotta Bhasha",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.4,
                Text("Kokborok",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.6,
                Text("Magahi Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.7,
                Text("Manbhumi Dialect",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.8,
                Text("Nepali Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(2.9,
                Text("Sadri Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(3.0,
                Text("Santali Language",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
              FadeAnimation(3.1,
                Text("Urdu Zabaan",style: GoogleFonts.aBeeZee(
                  fontSize: 21,
                ),),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
