import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'dark_profile.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
            seconds: 4,
            title: Text("Come Back After Next Update",textScaleFactor: 2,textAlign: TextAlign.center,style: GoogleFonts.robotoSerif(
              fontWeight: FontWeight.w600,fontSize: 13
            ),),
            image: Image.network('https://img.freepik.com/free-vector/coming-soon-teaser-promo-display-background_1017-33738.jpg?w=740&t=st=1660177820~exp=1660178420~hmac=6c1540fb86473e1a5de43bf41314bca85166017a81f7ba680d0443d830b80211',
              fit:BoxFit.cover,),
            // loadingText: Text("Loading",textAlign: TextAlign.center,style: GoogleFonts.anekOdia(
            //   fontWeight: FontWeight.w500,
            // )),
            photoSize: 200.0,
            // backgroundColor: Colors.orangeAccent,
            useLoader: false,
            // loaderColor: Colors.blue,
            navigateAfterSeconds: ProfilePage(mail: '',)
        )
    );
  }
}
