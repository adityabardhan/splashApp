// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:splash/firebase/fireAuth.dart';
import 'package:splash/register.dart';
import 'Animation/FadeAnimation.dart';
import 'forgot.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  String state;
  LoginPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  bool screenLoader = true;

  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _show = true;
  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange.shade900,
            Colors.orange.shade800,
            Colors.orange.shade400,
            Colors.orange.shade400
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Welcome Back",
                          style: GoogleFonts.alike(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "We've missed you !",
                          style: GoogleFonts.alike(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                          ),
                          FadeAnimation(
                              1.5,
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: mail,
                                      validator: (String? val) {
                                        if (val!.length < 5 ||
                                            !(val.contains(".com"))) {
                                          return "Invalid Email";
                                        }
                                        return null;
                                      },
                                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                                      onSaved: (String? val) {
                                        setState(() {
                                          mail.text = val!;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade500),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.mail_outline,
                                          color: Colors.orangeAccent,
                                        ),
                                        hintText: "Email Address",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      onSaved: (String? val) {
                                        setState(() {
                                          pass.text = val!;
                                        });
                                      },
                                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                                      controller: pass,
                                      validator: (String? value) {
                                        RegExp regex = RegExp(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                        if (value!.isEmpty) {
                                          return "Please Enter Password";
                                        } else if (!regex.hasMatch(value)) {
                                          return "Incorrect Password";
                                        }
                                        return null;
                                      },
                                      obscureText: _show,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade500),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock_outline_sharp,
                                            color: Colors.orangeAccent,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: toggle,
                                            icon: Icon(
                                                _show
                                                    ? (Icons.visibility)
                                                    : Icons.visibility_off,
                                                color: Colors.orangeAccent),
                                          ),
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeAnimation(
                                1.7,
                                const Text(
                                  "Don't have an Account? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 15),
                                ),
                              ),
                              FadeAnimation(
                                1.7,
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: const Text(
                                    "Register here",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500, fontSize: 15,
                                      color: Colors.grey,
                                      //Color(0xff4c505b),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              1.8,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPage()));
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 35,
                          ),
                          FadeAnimation(
                            2.0,
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[900]),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange[800],
                                    elevation: 5,
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                    minimumSize: Size.fromHeight(50),
                                    shape: StadiumBorder(),
                                  ),
                                  child: isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text("Login"),
                                  onPressed: () async {
                                    if (isLoading) return;
                                    setState(() => isLoading = true);
                                    await Future.delayed(Duration(seconds: 2));
                                    setState(() {
                                      isLoading = false;
                                    });
                                    if (_formkey.currentState!.validate()) {
                                      _formkey.currentState!.save();

                                      screenLoader?const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(Colors.green),
                                      ):Container();

                                      try {
                                        UserCredential userCredential =
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: mail.text,
                                                    password: pass.text);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                    mail: mail.text,
                                                    state: "West Bengal")));
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  content: Text(
                                                    "No user found for that email",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.red,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )));

                                          print(
                                              'No user found for that email.');
                                        } else if (e.code == 'wrong-password') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                            "Wrong password provided for the user",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                            ),
                                            textAlign: TextAlign.center,
                                          )));

                                          print(
                                              'Wrong password provided for that user.');
                                        }
                                      }

                                      setState((){
                                        screenLoader = false;
                                      });
                                    }
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          FadeAnimation(
                            2.1,
                            const Text(
                              "OR Continue with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          FadeAnimation(
                            2.2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    signInWithGoogle(context);
                                  },
                                  child: Icon(
                                    (FontAwesomeIcons.google),
                                    color: Colors.red.shade600,
                                    size: 32,
                                  ),
                                ),
                                //SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {

                                    setState((){
                                      screenLoader = true;
                                    });

                                    screenLoader?const CircularProgressIndicator(
                                      color: Colors.green,
                                    ):Container();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                      "Logging In via Twitter",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    )));

                                    setState((){
                                      screenLoader = false;
                                    });

                                  },
                                  child: Icon(MdiIcons.twitter,
                                      size: 39,
                                      color: Colors.lightBlueAccent[400]),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                      "Logging In via Facebook",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    )));
                                  },
                                  child: Icon(MdiIcons.facebook,
                                      size: 39, color: Colors.blueAccent[200]),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                      "Logging In via Linkedin",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    )));
                                  },
                                  child: Icon(MdiIcons.linkedin,
                                      size: 38,
                                      color: Colors.indigoAccent[200]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toggle() {
    setState(() {
      _show = !_show;
    });
  }
}

/*

 */
