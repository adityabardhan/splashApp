import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/home.dart';
import 'package:splash/login.dart';
import 'package:splash/register.dart';
import 'package:splashscreen/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showSplash = true;

  @override
  Widget build(BuildContext context) {
    final navigator = GlobalKey<NavigatorState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      home: showSplash?SplashScreen(
        seconds: 4,
        title: Text("Civic Utility",textScaleFactor: 2,textAlign: TextAlign.center,style: GoogleFonts.amiri(
          fontWeight: FontWeight.w400,fontSize: 20
        ),),
        image: Image.network("https://img.freepik.com/free-vector/hello-concept-illustration_114360-4746.jpg?w=740&t=st=1660174295~exp=1660174895~hmac=6bee5adce688f2c07607ee6c6c6892eb610c5181f13229446e1ab3af0a445e25",
        fit: BoxFit.cover,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.color,
        ),
        loadingText: Text("The new Age of Learning & Knowledge",textAlign: TextAlign.center,style: GoogleFonts.kadwa(
            fontWeight: FontWeight.w400,
        )),
        photoSize: 170.0,
        loaderColor: Colors.amber.shade400,
        navigateAfterSeconds: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage(mail: "", state: "");
            } else {
              return LoginPage(state: "");
            }
          },
        ),
      ):StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(mail: "", state: "");
          } else {
            return LoginPage(state: "");
          }
        },
      ),
    );
  }
}
// Image.asset('assest/images/home_Image/hi.jpg',fit: BoxFit.cover,),
// https://github.com/adityabardhan/splashApp/blob/883ed5650e34a8c0205cf4197aa6eae175513718/Civic%20Utility.apk