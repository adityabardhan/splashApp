import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:splash/login.dart';
import 'package:splash/screens/light_profile.dart';
import 'package:splashscreen/splashscreen.dart';

import '../firebase/fireAuth.dart';
import '../home.dart';
import 'new file.dart';

class ProfilePage extends StatefulWidget {
  String mail;
  ProfilePage({Key? key, required this.mail}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(mail: widget.mail, state: "West Bengal")));
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomePage(mail: widget.mail, state: "West Bengal"))),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "PROFILE",
            style: GoogleFonts.acme(
                fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.light_mode_sharp,
                      color: Colors.white,
                    ),
                    splashRadius: 25.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LightProfile(mail: widget.mail)));
                    })),
          ],
        ),
        backgroundColor: Color(0xCC3b444b),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: user==null?CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black12,
                      backgroundImage: AssetImage('assest/images/home_Image/27002.jpg'),
                    ):CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black12,
                      backgroundImage: NetworkImage(user!.photoURL!),
                    ),
                  ),
                ),
                user!=null?Text(user!.displayName!
                  ,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ):Text("Aditya Bardhan"
                  ,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ) ,
                SizedBox(
                  height: 5,
                ),
                user!=null?Text(user!.email!
                  ,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ):Text(widget.mail
                  ,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: 240,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent,
                      elevation: 3,
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                      minimumSize: Size.fromHeight(45),
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Text(
                      "UPGRADE TO PRO",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    onPressed: () {
                      // SplashScreen(
                      //     seconds: 3,
                      //     title: Text("Feature is Not Available Now",textScaleFactor: 2,textAlign: TextAlign.center,style: GoogleFonts.amiri(
                      //       fontWeight: FontWeight.w600,
                      //     ),),
                      //     image: Image.asset('assest/images/home_Image/comingSoon.jpg',fit:BoxFit.cover,),
                      //     // loadingText: Text("Loading",textAlign: TextAlign.center,style: GoogleFonts.anekOdia(
                      //     //   fontWeight: FontWeight.w500,
                      //     // )),
                      //     photoSize: 100.0,
                      //     // loaderColor: Colors.blue,
                      //     navigateAfterSeconds: ProfilePage(mail: '',)
                      // );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ComingSoon()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        "Feature Not Available Now",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )));
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // const Divider(
                //   thickness: 2, // thickness of the line
                //   indent: 10, // empty space to the leading edge of divider.
                //   endIndent: 10, // empty space to the trailing edge of the divider.
                //   color: Colors.white, // The color to use when painting the line.
                //   height: 10, // The divider's height extent.
                // ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10.0),
                  children: [
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "UPDATE PROFILE",
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "SETTINGS",
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Icon(
                            MdiIcons.security,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "PRIVACY & SECURITY",
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade600,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Icon(
                            Icons.help_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            "HELP & SUPPORT",
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade600,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage(state: '')));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Icon(
                              Icons.logout_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(
                              "LOGOUT",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 25,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
