// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:splash/login.dart';

import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool screenLoader = true;

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController loc = TextEditingController();
  DateTime? dateTime;

  final List<String> items = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  String? state;

  bool isDone = false;

  final _formkey = GlobalKey<FormState>();

  bool? fPass = true;
  bool? sPass = true;

  void toggle1() {
    setState(() {
      fPass = !fPass!;
    });
  }

  void toggle2() {
    setState(() {
      sPass = !sPass!;
    });
  }

  changeLoader() {
    setState(() {
      screenLoader = !screenLoader;
    });
  }

  Future<void> addUser() {
    return users
        .add({
      'name': name.text,
      'mail': mail.text,
      'pass': pass.text,
      'dob': dob.text,
      'state': state

    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  CollectionReference users = FirebaseFirestore.instance.collection('Details');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: const DecorationImage(
            image: AssetImage("assest/images/register.jpeg"),
            fit: BoxFit.cover),
      ),
      child: Form(
        key: _formkey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 80, top: 80),
                  child: Text(
                    "Create Your New\nAccount",
                    style: GoogleFonts.alike(
                      fontSize: 33,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.23,
                      left: 40,
                      right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        onSaved: (String? value) {
                          name.text = value.toString();
                        },
                        validator: (String? value) {
                          if (value!.length < 5) {
                            return "Inaccurate Name";
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: name,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          fillColor: Colors.grey.shade100,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: mail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value!.length < 5 ||
                              !(value.contains("@gmail.com"))) {
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          mail.text = value.toString();
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   controller: dob,
                      //   keyboardType: TextInputType.datetime,
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide(color: Colors.blueGrey),
                      //     ),
                      //     fillColor: Colors.grey.shade200,
                      //     filled: true,
                      //     hintText: "DOB (dd-mm-yyyy)",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Can't leave Empty";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: dob,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Date of Birth",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            initialDate: DateTime.now(),
                          );
                          if (dateTime != null) {
                            String formatDate =
                                DateFormat('dd-MM-yyyy').format(dateTime!);
                            setState(() {
                              dob.text = formatDate;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
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
                        onSaved: (String? value) {
                          pass.text = value.toString();
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: pass,
                        obscureText: fPass!,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            splashColor: Colors.blue,
                            splashRadius: 25.0,
                            onPressed: toggle1,
                            icon: Icon(
                              fPass! ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value == null) {
                            return "Required Field";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(MdiIcons.mapMarkerRadiusOutline),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Select Your State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        value: state,
                        items: items.map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          state = newValue!;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade800,
                            textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                            minimumSize: Size.fromHeight(60),
                            shape: StadiumBorder(),
                          ),
                          child: isDone
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text("Register"),
                          onPressed: () async {
                            if (isDone) return;
                            setState(() => isDone = true);
                            await Future.delayed(Duration(seconds: 2));
                            setState(() {
                              isDone = false;
                            });
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();

                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: mail.text,
                                  password: pass.text,
                                );
                                addUser();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPage(state: "")));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "The password provided is too weak",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        backgroundColor: Colors.white),
                                    textAlign: TextAlign.center,
                                  )));
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "The account already exists for that email",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        ),
                                    textAlign: TextAlign.center,
                                  )));

                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                content: Text(
                                  "Account Created Successfully!",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                )));

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginPage(state:state.toString())));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSmallButton(var isDone) {
    final color = Color(0xff4c505b);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: isDone
            ? const Icon(
                Icons.done,
                color: Colors.greenAccent,
                size: 30,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
      ),
    );
  }
}

// class Utils {
//    static showSnackBar(String? text){
//     if (text!=null){
//       final messengerKey = GlobalKey<ScaffoldMessengerState>();
//       final snack = SnackBar(content: Text(text),backgroundColor: Colors.red,);
//       messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snack);
//     }
//   }
// }
