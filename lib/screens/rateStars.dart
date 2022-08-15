import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:splash/home.dart';
import 'package:splashscreen/splashscreen.dart';

import 'drawer.dart';

class RateStars extends StatefulWidget {
  const RateStars({Key? key}) : super(key: key);

  @override
  State<RateStars> createState() => _RateStarsState();
}

class _RateStarsState extends State<RateStars> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 5,
        image: Image.network("https://img.freepik.com/premium-vector/confused-person-surrounded-by-question-marks-man-doesnt-know-character-tries-find-solution_254969-2555.jpg?w=740"),
        title: Text("The feature is still in it's \"Developing Phase\"",textAlign: TextAlign.center,
        style: GoogleFonts.amita(fontSize: 30)
        ),
        loadingText: Text("We appreciate your Patience\n\"Patience is bitter, but its fruit is sweet\"",textAlign:
          TextAlign.center,style: GoogleFonts.amita(fontSize: 18),),
        useLoader: false,
        photoSize: 180,
        navigateAfterSeconds: HomePage(mail: '', state: '',),
      ),
    );
  }
}

